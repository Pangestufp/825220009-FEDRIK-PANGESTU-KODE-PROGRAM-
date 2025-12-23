<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangReturController extends Controller
{
    

    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role == 'partner') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Faktur'], 403);
        }

        $request->validate([
            'id_faktur' => 'required|integer',
            'id_tipe' => 'required|integer',
            'detail' => 'required|array|min:1',
            'detail.*.id_barang' => 'required|integer',
            'detail.*.jumlah' => 'required|integer|min:1'
        ]);

        DB::beginTransaction();

        try {
            // Insert header retur
            $idRetur = DB::table('barangretur')->insertGetId([
                'id_user'  => $user->id,
                'id_faktur' => $request->id_faktur,
                'id_tipe'   => $request->id_tipe,
                'totalrefund' => 0,
                'createat' => now()
            ]);

            $totalRefund = 0;

            foreach ($request->detail as $item) {

                // Ambil info harga dari view v_faktur_retur
                $row = DB::table('v_fakturretur')
                    ->where('id_faktur', $request->id_faktur)
                    ->where('id_barang', $item['id_barang'])
                    ->lockForUpdate()
                    ->first();

                if (!$row) {
                    throw new \Exception("Barang tidak terdaftar pada faktur");
                }

                // Cek apakah retur melebihi maxretur
                if ($item['jumlah'] > $row->maxretur) {
                    throw new \Exception("Jumlah retur melebihi batas maksimal");
                }

                // Insert detail retur
                DB::table('detailretur')->insert([
                    'id_retur' => $idRetur,
                    'id_barang' => $item['id_barang'],
                    'jumlahretur' => $item['jumlah']
                ]);

                // Hitung total refund hanya jika tipe 1
                if ($request->id_tipe == 1) {
                    $totalRefund += $row->harga * $item['jumlah'];
                    $idBarang = $item['id_barang'];
                    $qty = (int) $item['jumlah'];

                    $barang = DB::table('barang')
                        ->where('id_barang', $idBarang)
                        ->lockForUpdate()
                        ->first();

                    if (!$barang) {
                        throw new \Exception("Barang dengan id {$idBarang} tidak ditemukan");
                    }

                    if ($barang->stok < $qty) {
                        throw new \Exception("Stok barang id {$idBarang} tidak mencukupi. Stok saat ini: {$barang->stok}");
                    }

                    // Lakukan update stok
                    DB::table('barang')
                        ->where('id_barang', $idBarang)
                        ->update([
                        'stok'     => $barang->stok - $qty,
                        'updateat' => now(),
                    ]);

                }
            }

            // Update total refund di header retur
            DB::table('barangretur')
                ->where('id_retur', $idRetur)
                ->update(['totalrefund' => $totalRefund]);

            DB::commit();

            return response()->json(['message' => 'Retur berhasil disimpan'], 201);

        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json([
                'message' => $th->getMessage()
            ], 500);
        }
    }



     public function getAll()
    {
        $barang = DB::table('v_barangretur')->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }


    public function getAvailable($id)
    {
        $barang = DB::table('v_fakturretur')->where('id_faktur', $id)->get();

        if (!$barang) {
            return response()->json(['message' => 'Data tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function getById($id)
    {
        $barang = DB::table('v_barangretur')->where('id_retur', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Data retur tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function getDetailById($id)
    {
        $barang = DB::table('v_detailbarangretur')->where('id_retur', $id)->get();

        if (!$barang) {
            return response()->json(['message' => 'Data retur tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }
}
