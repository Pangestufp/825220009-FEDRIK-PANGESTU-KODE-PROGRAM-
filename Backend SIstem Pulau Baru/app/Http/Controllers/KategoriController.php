<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class KategoriController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan kategori']);
        }

        $request->validate([
            'namakategori' => 'required|string|max:25',
            'deskripsi' => 'required|string|max:200',
        ]);

        $kategoriExists = DB::table('kategori')
            ->where('namakategori', $request->namakategori)
            ->where('status', 1)
            ->exists();

        if ($kategoriExists) {
            return response()->json([
                'message' => 'Kategori dengan nama tersebut sudah aktif.'
            ], 422);
        }

        DB::table('kategori')->insert([
            'namakategori' => $request->namakategori,
            'deskripsi' => $request->deskripsi,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Kategori berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah kategori']);
        }

        $request->validate([
            'namakategori' => 'sometimes|required|string|max:25',
            'deskripsi' => 'sometimes|required|string|max:200',
        ]);

        $data = [];

        if ($request->has('namakategori')) {
            $data['namakategori'] = $request->namakategori;
        }
        if ($request->has('deskripsi')) {
            $data['deskripsi'] = $request->deskripsi;
        }
        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('kategori')->where('id_kategori', $id)->update($data);

        return response()->json(['message' => 'Kategori berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request,$id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah kategori']);
        }

        DB::table('kategori')->where('id_kategori', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status kategori telah diubah menjadi non-aktif.'], 200);
    }

    public function getAll()
    {
        $kategoris = DB::table('kategori')->where('status', 1)->orderBy('createat','desc')->get();

        if ($kategoris->isEmpty()) {
            return response()->json(['message' => 'Tidak ada kategori aktif ditemukan.'], 404);
        }

        return response()->json($kategoris, 200);
    }

    public function getById($id)
    {
        $kategori = DB::table('kategori')->where('id_kategori', $id)->first();

        if (!$kategori) {
            return response()->json(['message' => 'Kategori tidak ditemukan atau sudah tidak aktif.'], 404);
        }

        return response()->json($kategori, 200);
    }
}
