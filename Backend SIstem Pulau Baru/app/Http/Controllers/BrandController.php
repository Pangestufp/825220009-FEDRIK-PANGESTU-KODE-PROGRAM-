<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class BrandController extends Controller
{

    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Brand']);
        }

        $request->validate([
            'namabrand' => 'required|string|max:50',
        ]);

        $brandExists = DB::table('brand')
            ->where('namabrand', $request->namabrand)
            ->where('status', 1)
            ->exists();

        if ($brandExists) {
            return response()->json([
                'message' => 'Brand dengan nama tersebut sudah terdaftar dan aktif.'
            ], 422);
        }

        DB::table('brand')->insert([
            'namabrand' => $request->namabrand,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Brand berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Brand']);
        }

        $request->validate([
            'namabrand' => 'sometimes|required|string|max:50',
        ]);

        
        $data = [];

        if ($request->has('namabrand')) {
            $data['namabrand'] = $request->namabrand;
        }
        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('brand')->where('id_brand', $id)->update($data);

        return response()->json(['message' => 'Brand berhasil diperbarui.'], 200);
    }


    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Brand']);
        }

        $brand = DB::table('brand')->where('id_brand', $id)->first();

        if (!$brand) {
            return response()->json(['message' => 'Brand tidak ditemukan.'], 404);
        }

        DB::table('brand')->where('id_brand', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Brand telah dinonaktifkan.'], 200);
    }

    public function getAll()
    {
        $brands = DB::table('brand')->where('status', 1)->orderBy('createat','desc')->get();

        if ($brands->isEmpty()) {
            return response()->json(['message' => 'Tidak ada Brand aktif ditemukan.'], 404);
        }

        return response()->json($brands, 200);
    }

    public function getById($id)
    {
        $brand = DB::table('brand')->where('id_brand', $id)->first();

        if (!$brand) {
            return response()->json(['message' => 'Brand tidak ditemukan atau sudah tidak aktif.'], 404);
        }

        return response()->json($brand, 200);
    }
}
