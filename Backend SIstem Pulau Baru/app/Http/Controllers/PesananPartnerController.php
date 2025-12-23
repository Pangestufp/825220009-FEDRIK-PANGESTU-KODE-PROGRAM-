<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PesananPartnerController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'partner') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Pesanan'], 200);
        }

        $request->validate([
            'detail' => 'required|array|min:1',
            'detail.*.id_barang' => 'required|integer',
            'detail.*.hargajual' => 'required|numeric|min:0',
            'detail.*.jumlah' => 'required|integer|min:1',
        ]);

        $totalTransaksi = collect($request->detail)->reduce(function ($carry, $item) {
            return $carry + ($item['hargajual'] * $item['jumlah']);
        }, 0);


        DB::beginTransaction();
        try {

             $result = DB::select('CALL getDocNo(?)', [$user->id]);
            $idTransaksi = $result[0]->docno;


            foreach ($request->detail as $detail) {
                $barang = DB::table('barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->lockForUpdate()
                    ->first();

                if (!$barang) {
                    throw new \Exception("Barang tidak ditemukan");
                }

                if ($barang->stok < $detail['jumlah']) {
                    throw new \Exception("Stok tidak mencukupi");
                }

                $vBarang = DB::table('v_barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->first();

                if (!$vBarang) {
                    throw new \Exception("Data harga beli tidak ditemukan");
                }

            }

            DB::table('barangkeluar')->insert([
                'id_transaksi' => $idTransaksi,
                'id_user' => $user->id,
                'pesananpartner' => 1,
                'total' => $totalTransaksi,
                'status' => 'draft',
                'createat' => Carbon::now(),
                'updateat' => Carbon::now(),
            ]);

            DB::table('pesananpartner')->insert([
                'id_transaksi' => $idTransaksi,
                'status' => 'draft',
                'createat' => Carbon::now(),
                'updateat' => Carbon::now(),
            ]);

            foreach ($request->detail as $detail) {
                $total = $detail['hargajual'] * $detail['jumlah'];
                DB::table('detailbarangkeluar')->insert([
                    'id_transaksi' => $idTransaksi,
                    'id_barang' => $detail['id_barang'],
                    'hargajual' => $detail['hargajual'],
                    'jumlah' => $detail['jumlah'],
                    'total' => $total,
                ]);
            }

            DB::commit();

            return response()->json([
                'message' => 'Sukses',
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => $e->getMessage(),
            ], 200);
        }

    }

    public function updateSetuju(Request $request, $id)
    {

        $user = $request->user();
        $role = $user->role;
        if ($role == 'karyawan') {
            return response()->json(['message' => 'Anda tidak bisa mengubah status pesanan'], 200);
        }

        $pesanan = DB::table('pesananpartner')->where('id_transaksi', $id)->first();

        if (!$pesanan) {
            return response()->json(['message' => 'Pesanan tidak ditemukan.'], 404);
        }

        if ($pesanan->status === 'disetujui') {
            return response()->json(['message' => 'Pesanan sudah disetujui sebelumnya'], 200);
        }

        if ($pesanan->status === 'ditolak') {
            return response()->json(['message' => 'Pesanan sudah ditolak sebelumnya'], 200);
        }

        if ($pesanan->status === 'selesai') {
            return response()->json(['message' => 'Pesanan sudah selesai sebelumnya'], 200);
        }

        if ($pesanan->status === 'returned' && $role !== 'partner') {
            return response()->json(['message' => 'Hanya partner yang bisa menyetujui pesanan yang dikembalikan'], 200);
        }

        if ($pesanan->status !== 'returned' && $role !== 'pemilik') {
            return response()->json(['message' => 'Hanya pemilik yang bisa menyetujui pesanan ini'], 200);
        }

        $detailBarang = DB::table('detailbarangkeluar')
        ->where('id_transaksi', $id)
        ->get();

        if ($detailBarang->isEmpty()) {
            return response()->json(['message' => 'Detail barang untuk transaksi ini tidak ditemukan.'], 404);
        }

        foreach ($detailBarang as $detail) {
            $barang = DB::table('barang')->where('id_barang', $detail->id_barang)->first();

            if (!$barang) {
                return response()->json([
                    'message' => "Barang dengan ID {$detail->id_barang} tidak ditemukan."
                ], 200);
            }

            if ($barang->stok < $detail->jumlah) {
                return response()->json([
                    'message' => "Stok untuk barang '{$barang->namabarang}' tidak mencukupi. 
                                (stok: {$barang->stok}, diminta: {$detail->jumlah})"
                ], 200);
            }
        }
        

        DB::table('pesananpartner')
            ->where('id_transaksi', $id)
            ->update([
                'status'   => 'disetujui',
                'updateat' => Carbon::now()
            ]);

        return response()->json([
            'message' => 'Pesanan berhasil diperbarui menjadi disetujui'
        ], 200);
    }

    public function updateTolak(Request $request, $id){
        $user = $request->user();
        $role = $user->role;

        if ($role == 'karyawan') {
            return response()->json(['message' => 'Anda tidak bisa mengubah status pesanan'], 200);
        }

        $pesanan = DB::table('pesananpartner')->where('id_transaksi', $id)->first();

        if (!$pesanan) {
            return response()->json(['message' => 'Pesanan tidak ditemukan.'], 404);
        }
        if (in_array($pesanan->status, ['disetujui', 'ditolak', 'selesai'])) {
            return response()->json([
                'message' => 'Pesanan sudah ' . $pesanan->status . ' sebelumnya'
            ], 200);
        }

        $isMoreThan2Weeks = false;
        if ($pesanan->createat) {
            $isMoreThan2Weeks = Carbon::parse($pesanan->createat)->lt(Carbon::now()->subWeeks(2));
        }

        if ($isMoreThan2Weeks && $role === 'pemilik') {
            
        } else {
            if ($pesanan->status === 'returned' && $role !== 'partner') {
                return response()->json(['message' => 'Hanya partner yang bisa menolak pesanan yang dikembalikan'], 200);
            }

            if ($pesanan->status !== 'returned' && $role !== 'pemilik') {
                return response()->json(['message' => 'Hanya pemilik yang bisa menolak pesanan ini'], 200);
            }
        }

        DB::table('pesananpartner')
            ->where('id_transaksi', $id)
            ->update([
                'status'   => 'ditolak',
                'updateat' => Carbon::now()
            ]);

        return response()->json([
            'message' => 'Pesanan berhasil diperbarui menjadi ditolak'
        ], 200);
    }


    public function updateSelesai(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah status pesanan'], 403);
        }

        DB::beginTransaction();
        try {
            $pesanan = DB::table('pesananpartner')->where('id_transaksi', $id)->lockForUpdate()->first();

            if (!$pesanan) {
                return response()->json(['message' => 'Pesanan tidak ditemukan.'], 404);
            }

            if (in_array($pesanan->status, ['ditolak', 'returned', 'draft', 'selesai'])) {
                return response()->json(['message' => 'Status pesanan tidak bisa diubah dari status saat ini.'], 200);
            }

            if ($pesanan->status === 'disetujui') {

                // Ambil detail transaksi dari tabel detailbarangkeluar
                $detailBarang = DB::table('detailbarangkeluar')
                    ->where('id_transaksi', $id)
                    ->get();

                if ($detailBarang->isEmpty()) {
                    return response()->json(['message' => 'Detail barang untuk transaksi ini tidak ditemukan.'], 404);
                }

                $totalTransaksi = 0;
                $totalKeuntungan = 0;

                foreach ($detailBarang as $detail) {
                    $vBarang = DB::table('v_barang')
                        ->where('id_barang', $detail->id_barang)
                        ->first();

                    if (!$vBarang) {
                        throw new \Exception("Data harga beli untuk barang ID {$detail->id_barang} tidak ditemukan");
                    }

                    DB::table('barang')
                    ->where('id_barang', $detail->id_barang)
                    ->decrement('stok', $detail->jumlah, [
                        'updateat' => Carbon::now(),
                    ]);


                    $subtotal = $detail->hargajual * $detail->jumlah;
                    $keuntunganBarang = ($detail->hargajual - $vBarang->hargabeli) * $detail->jumlah;

                    $totalTransaksi += $subtotal;
                    $totalKeuntungan += $keuntunganBarang;


                }

                // Simpan log harian
                $idLog = Carbon::now()->format('Ymd');
                $logExist = DB::table('logpenjualanharian')->where('idlogpenjualan', $idLog)->lockForUpdate()->first();

                if ($logExist) {
                    DB::table('logpenjualanharian')
                        ->where('idlogpenjualan', $idLog)
                        ->update([
                            'totalhitungansistem' => DB::raw("totalhitungansistem + $totalTransaksi"),
                            'keuntungansistem'    => DB::raw("keuntungansistem + $totalKeuntungan"),
                            'totalomset'          => DB::raw("totalomset + $totalTransaksi"),
                            'totalkeuntungan'     => DB::raw("totalkeuntungan + $totalKeuntungan"),
                            'updateat'            => Carbon::now(),
                        ]);
                } else {
                    DB::table('logpenjualanharian')->insert([
                        'idlogpenjualan'   => $idLog,
                        'id_user'          => $user->id,
                        'omsetinput'       => 0,
                        'totalhitungansistem' => $totalTransaksi,
                        'keuntungansistem'    => $totalKeuntungan,
                        'totalomset'          => $totalTransaksi,
                        'totalkeuntungan'     => $totalKeuntungan,
                        'createat'            => Carbon::now(),
                        'updateat'            => Carbon::now(),
                    ]);
                }

                // Update status di pesananpartner dan barangkeluar
                DB::table('pesananpartner')
                    ->where('id_transaksi', $id)
                    ->update([
                        'status'   => 'selesai',
                        'updateat' => Carbon::now(),
                    ]);

                DB::table('barangkeluar')
                    ->where('id_transaksi', $id)
                    ->update([
                        'status'   => 'selesai',
                        'updateat' => Carbon::now(),
                    ]);
            }

            DB::commit();
            return response()->json(['message' => 'Pesanan berhasil diperbarui menjadi selesai dan keuntungan disimpan.'], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Terjadi kesalahan: ' . $e->getMessage()], 200);
        }
    }


    public function updateReturn(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah pesanan'], 403);
        }

        $request->validate([
            'detail' => 'required|array|min:1',
            'detail.*.id_barang' => 'required|integer',
            'detail.*.hargajual' => 'required|numeric|min:0',
            'detail.*.jumlah' => 'required|integer|min:1',
        ]);

        DB::beginTransaction();

        $pesanan = DB::table('pesananpartner')->where('id_transaksi', $id)->lockForUpdate()->first();

        if (!$pesanan) {
            return response()->json(['message' => 'Pesanan tidak ditemukan.'], 200);
        }

        if ($pesanan->status !== 'draft') {
            return response()->json(['message' => 'Pesanan ini tidak bisa di proses'], 200);
        }

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda ini tidak bisa di proses'], 200);
        }

        try {
            $barangKeluar = DB::table('barangkeluar')
                ->where('id_transaksi', $id)
                ->lockForUpdate()
                ->first();

            if (!$barangKeluar) {
                return response()->json(['message' => 'Transaksi tidak ditemukan.'], 404);
            }

            DB::table('detailbarangkeluar')->where('id_transaksi', $id)->delete();

            $totalTransaksi = 0;
            $totalKeuntungan = 0;

            foreach ($request->detail as $detail) {
                $barang = DB::table('barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->lockForUpdate()
                    ->first();

                if (!$barang) {
                    throw new \Exception("Barang dengan ID {$detail['id_barang']} tidak ditemukan");
                }

                if ($barang->stok < $detail['jumlah']) {
                    throw new \Exception("Stok tidak mencukupi");
                }

                $vBarang = DB::table('v_barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->first();

                if (!$vBarang) {
                    throw new \Exception("Data harga beli untuk barang ID {$detail['id_barang']} tidak ditemukan");
                }

                $subtotal = $detail['hargajual'] * $detail['jumlah'];
                $keuntunganBarang = ($detail['hargajual'] - $vBarang->hargabeli) * $detail['jumlah'];

                $totalTransaksi += $subtotal;
                $totalKeuntungan += $keuntunganBarang;

                DB::table('detailbarangkeluar')->insert([
                    'id_transaksi' => $id,
                    'id_barang'    => $detail['id_barang'],
                    'hargajual'    => $detail['hargajual'],
                    'jumlah'       => $detail['jumlah'],
                    'total'        => $subtotal,
                ]);
            }

            DB::table('barangkeluar')
                ->where('id_transaksi', $id)
                ->update([
                    'total'     => $totalTransaksi,
                    'status'    => 'returned',
                    'updateat'  => Carbon::now(),
                ]);

            DB::table('pesananpartner')
                ->where('id_transaksi', $id)
                ->update([
                    'status'   => 'returned',
                    'updateat' => Carbon::now(),
                ]);
            
            DB::commit();
            return response()->json([
                'message' => 'Pesanan berhasil dikembalikan (returned) dan data telah diperbarui.',
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Terjadi kesalahan: ' . $e->getMessage()], 200);
        }
    }

    public function getAll()
    {
        $barang = DB::table('v_pesananpartner')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    } 
    
    public function getAllByIDUser(Request $request)
    {
        $user = $request->user();

        $headers = DB::table('v_pesananpartner')
            ->where('id_user', $user->id)
            ->get();

        if ($headers->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data yang ditemukan.'], 404);
        }

        $data = $headers->map(function ($header) {
            $detail = DB::table('v_detailbarangkeluar')
                ->where('id_transaksi', $header->id_transaksi)
                ->get();

            $header->detail = $detail;

            return $header;
        });

        return response()->json($data, 200);
    }


    public function getById($id)
    {
        $barang = DB::table('v_pesananpartner')->where('id_transaksi', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Data tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

}