<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class HargaBarangController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Harga Barang']);
        }

        $request->validate([
            'id_barang' => 'required|integer',
            'hargabeli' => 'required|numeric',
            'pilihan' => 'required|integer',
        ]);

        $lastHarga = DB::table('hargabarang')
                        ->where('id_barang', $request->id_barang)
                        ->orderBy('id_pararel', 'desc')
                        ->first();

        $nextIdPararel = $lastHarga ? $lastHarga->id_pararel + 1 : 1;

        DB::table('hargabarang')->insert([
            'id_barang' => $request->id_barang,
            'id_pararel' => $nextIdPararel,
            'hargabeli' => $request->hargabeli,
            'pilihan' => $request->pilihan,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        if ((int) $request->pilihan === 1) {
            DB::table('hargabarang')
            ->where('id_barang', $request->id_barang)
            ->where('id_pararel', '!=', $nextIdPararel)
            ->update([
                'pilihan' => 0,
                'updateat' => Carbon::now(),
            ]);
        }

        return response()->json(['message' => 'Harga barang berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id_barang, $id_pararel)
    {
        $current = DB::table('hargabarang')
            ->where('id_barang', $id_barang)
            ->where('id_pararel', $id_pararel)
            ->first();

        $countPilihan1 = DB::table('hargabarang')
            ->where('id_barang', $id_barang)
            ->where('pilihan', 1)
            ->count();

        if ($current && $current->pilihan == 1 && $countPilihan1 == 1 && isset($request->pilihan) && (int) $request->pilihan === 0) {
            return response()->json([
                'message' => 'Tidak bisa mengubah karena ini adalah satu-satunya pilihan'
            ], 400);
        }

        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah harga barang']);
        }

        $request->validate([
            'hargabeli' => 'sometimes|numeric',
            'pilihan' => 'sometimes|integer',
        ]);

        $updateData = [];

        if ($request->has('hargabeli')) $updateData['hargabeli'] = $request->hargabeli;
        if ($request->has('pilihan')) $updateData['pilihan'] = $request->pilihan;

        if (empty($updateData)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $updateData['updateat'] = Carbon::now();

        $updated = DB::table('hargabarang')
                    ->where('id_barang', $id_barang)
                    ->where('id_pararel', $id_pararel)
                    ->update($updateData);

        if ((int) $request->pilihan === 1) {
            DB::table('hargabarang')
            ->where('id_barang', $id_barang)
            ->where('id_pararel', '!=', $id_pararel)
            ->update([
                'pilihan' => 0,
                'updateat' => Carbon::now(),
            ]);
        }

        if (!$updated) {
            return response()->json(['message' => 'Data harga barang tidak ditemukan atau tidak ada perubahan.'], 404);
        }

        return response()->json(['message' => 'Harga barang berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request, $id_barang, $id_pararel)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah harga barang']);
        }

        $current = DB::table('hargabarang')
            ->where('id_barang', $id_barang)
            ->where('id_pararel', $id_pararel)
            ->first();

        if ($current && $current->pilihan == 1) {
            return response()->json([
                'message' => 'Tidak bisa mengubah karena ini adalah satu-satunya pilihan'
            ], 400);
        }
        

        $updated = DB::table('hargabarang')
                    ->where('id_barang', $id_barang)
                    ->where('id_pararel', $id_pararel)
                    ->update([
                        'status' => 0,
                        'updateat' => Carbon::now(),
                    ]);

        if (!$updated) {
            return response()->json(['message' => 'Data harga barang tidak ditemukan atau sudah nonaktif.'], 404);
        }

        return response()->json(['message' => 'Harga barang berhasil dinonaktifkan.'], 200);
    }

    public function getByIdBarang($id_barang)
    {
        $hargaBarang = DB::table('v_hargabarang')
                        ->where('id_barang', $id_barang)
                        ->where('status', 1)
                        ->orderBy('createat','desc')
                        ->get();

        if ($hargaBarang->isEmpty()) {
            return response()->json(['message' => 'Data harga barang tidak ditemukan.'], 404);
        }

        return response()->json($hargaBarang, 200);
    }

    public function getByIdBarangIdPararel($id_barang, $id_pararel)
    {
        $hargaBarang = DB::table('v_hargabarang')
                        ->where('id_barang', $id_barang)
                        ->where('id_pararel', $id_pararel)
                        ->first();

        if (!$hargaBarang) {
            return response()->json(['message' => 'Data harga barang tidak ditemukan.'], 404);
        }

        return response()->json($hargaBarang, 200);
    }
}
