<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FakturPembelianController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Faktur'], 403);
        }

        $request->validate([
            'id_supplier' => 'required|integer',
            'duedate' => 'required|date',
            'status' => 'required|string|max:10',
            'biayatambahan' => 'required|numeric',
            'detail' => 'required|array|min:1',
            'detail.*.id_barang' => 'required|integer',
            'detail.*.harga' => 'required|numeric',
            'detail.*.jumlah' => 'required|integer|min:1',
        ]);

        $totalHargaBarang = collect($request->detail)->reduce(function ($carry, $item) {
            return $carry + ($item['harga'] * $item['jumlah']);
        }, 0);

        DB::beginTransaction();
        try {
            $idFaktur = DB::table('fakturpembelian')->insertGetId([
                'id_supplier' => $request->id_supplier,
                'duedate' => $request->duedate,
                'status' => $request->status,
                'totalhargabarang' => $totalHargaBarang,
                'biayatambahan' => $request->biayatambahan,
                'createat' => Carbon::now(),
                'updateat' => Carbon::now(),
            ]);

            $biayaTambahan = $request->biayatambahan;
            
            foreach ($request->detail as $detail) {
                $subtotal = $detail['harga'] * $detail['jumlah'];
                $persen = $subtotal / $totalHargaBarang;

                $alokasiBiaya = $biayaTambahan * $persen;

                $hargaBaru = ($subtotal + $alokasiBiaya) / $detail['jumlah'];

                

                DB::table('detailfaktur')->insert([
                    'id_faktur' => $idFaktur,
                    'id_barang' => $detail['id_barang'],
                    'harga' => $detail['harga'],
                    'jumlah' => $detail['jumlah'],
                ]);

                $hargaBaru = ceil($hargaBaru / 100) * 100;

                $lastHarga = DB::table('hargabarang')
                    ->where('id_barang', $detail['id_barang'])
                    ->orderBy('id_pararel', 'desc')
                    ->first();

                $nextIdPararel = $lastHarga ? $lastHarga->id_pararel + 1 : 1;

                DB::table('hargabarang')->insert([
                    'id_barang' => $detail['id_barang'],
                    'id_pararel' => $nextIdPararel,
                    'hargabeli' => $hargaBaru,
                    'pilihan' => 1,
                    'status' => 1,
                    'createat' => Carbon::now(),
                    'updateat' => Carbon::now(),
                ]);

                DB::table('hargabarang')
                    ->where('id_barang', $detail['id_barang'])
                    ->where('id_pararel', '!=', $nextIdPararel)
                    ->update([
                        'pilihan' => 0,
                        'updateat' => Carbon::now(),
                    ]);


                DB::table('barang')
                    ->where('id_barang', $detail['id_barang'])
                    ->update([
                    'stok' => DB::raw('stok + ' . $detail['jumlah']),
                    'updateat' => Carbon::now(),
                ]);

            }

            DB::commit();

            return response()->json([
                'message' => 'Faktur berhasil ditambahkan.',
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Terjadi kesalahan saat menyimpan faktur',
            ], 500);
        }
    }

    
    public function getAll()
    {
        $barang = DB::table('v_fakturpembelian')->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }


    public function getById($id)
    {
        $barang = DB::table('v_fakturpembelian')->where('id_faktur', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Faktur tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function update($id)
    {
        $faktur = DB::table('fakturpembelian')->where('id_faktur', $id)->first();

        if (!$faktur) {
            return response()->json(['message' => 'Faktur tidak ditemukan.'], 404);
        }

        if ($faktur->status === 'lunas') {
            return response()->json(['message' => 'Faktur sudah lunas sebelumnya'], 200);
        }

        // Update status jadi lunas
        DB::table('fakturpembelian')
            ->where('id_faktur', $id)
            ->update([
                'status'   => 'lunas',
                'updateat' => Carbon::now()
            ]);

        return response()->json([
            'message' => 'Faktur berhasil diperbarui menjadi lunas'
        ], 200);
    }

    public function getDetailById($id)
    {
        $barang = DB::table('v_detailfaktur')->where('id_faktur', $id)->get();

        if (!$barang) {
            return response()->json(['message' => 'Faktur tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

}
