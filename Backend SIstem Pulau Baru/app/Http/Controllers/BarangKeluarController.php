<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangKeluarController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role == 'partner') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Pembelian'], 403);
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

        $totalKeuntungan = 0;

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

                $keuntunganBarang = ($detail['hargajual'] - $vBarang->hargabeli) * $detail['jumlah'];
                $totalKeuntungan += $keuntunganBarang;


                DB::table('barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->decrement('stok', $detail['jumlah'], [
                        'updateat' => Carbon::now(),
                    ]);

            }

            DB::table('barangkeluar')->insert([
                'id_transaksi' => $idTransaksi,
                'id_user' => $user->id,
                'pesananpartner' => 0,
                'total' => $totalTransaksi,
                'status' => 'selesai',
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



            $idLog = Carbon::now()->format('Ymd');

            $affected = DB::table('logpenjualanharian')
                ->where('idlogpenjualan', $idLog)
                ->lockForUpdate()
                ->first();

            if ($affected) {
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


            DB::commit();

            return response()->json([
                'message' => 'Barang keluar berhasil dicatat.',
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            $statusCode = str_contains($e->getMessage(), 'Stok tidak mencukupi') ? 422 : 500;
            return response()->json([
                'message' => $e->getMessage(),
            ], $statusCode);
        }

    }

    public function getAll()
    {
        $barang = DB::table('v_barangkeluar')->where('pesananpartner', 0)->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }


    public function getById($id)
    {
        $barang = DB::table('v_barangkeluar')->where('id_transaksi', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Transaksi tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function getDetailById($id)
    {
        $barang = DB::table('v_detailbarangkeluar')->where('id_transaksi', $id)->get();

        if (!$barang) {
            return response()->json(['message' => 'Transaksi tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

}
