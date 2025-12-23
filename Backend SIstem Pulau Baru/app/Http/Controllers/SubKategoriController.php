<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class SubKategoriController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Subkategori']);
        }

        $request->validate([
            'id_kategori' => 'required|integer',
            'namasubkategori' => 'required|string|max:25',
            'deskripsi' => 'required|string|max:200',
        ]);

        $subkategoriExists = DB::table('subkategori')
        ->where('id_kategori', $request->id_kategori)
            ->where('namasubkategori', $request->namasubkategori)
            ->where('status', 1)
            ->exists();

        if ($subkategoriExists) {
            return response()->json([
                'message' => 'Subkategori dengan nama tersebut sudah aktif dalam kategori ini.'
            ], 422);
        }

        DB::table('subkategori')->insert([
            'id_kategori' => $request->id_kategori,
            'namasubkategori' => $request->namasubkategori,
            'deskripsi' => $request->deskripsi,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'SubKategori berhasil ditambahkan.'], 201);
    }


    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Subkategori']);
        }

        $request->validate([
            'id_kategori' => 'sometimes|required|integer',
            'namasubkategori' => 'sometimes|required|string|max:25',
            'deskripsi' => 'sometimes|required|string|max:200',
        ]);

        $subkategori = DB::table('subkategori')->where('id_subkategori', $id)->first();

        if (!$subkategori) {
            return response()->json(['message' => 'SubKategori tidak ditemukan.'], 404);
        }

        $data = [];

        if ($request->has('id_kategori')) {
            $data['id_kategori'] = $request->id_kategori;
        }
        if ($request->has('namasubkategori')) {
            $data['namasubkategori'] = $request->namasubkategori;
        }
        if ($request->has('deskripsi')) {
            $data['deskripsi'] = $request->deskripsi;
        }

        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('subkategori')->where('id_subkategori', $id)->update($data);

        return response()->json(['message' => 'SubKategori berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Subkategori']);
        }

        $subkategori = DB::table('subkategori')->where('id_subkategori', $id)->first();

        if (!$subkategori) {
            return response()->json(['message' => 'SubKategori tidak ditemukan.'], 404);
        }
        

        DB::table('subkategori')->where('id_subkategori', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status subkategori telah diubah menjadi non-aktif.'], 200);
    }

    public function getAll()
    {
        $subkategoris = DB::table('v_subkategori')->where('status', 1)->orderBy('createat','desc')->get();

        if ($subkategoris->isEmpty()) {
            return response()->json(['message' => 'Tidak ada subkategori aktif ditemukan.'], 404);
        }

        return response()->json($subkategoris, 200);
    }

    public function getById($id)
    {
        $subkategori = DB::table('v_subkategori')->where('id_subkategori', $id)->first();

        if (!$subkategori) {
            return response()->json(['message' => 'SubKategori tidak ditemukan atau sudah tidak aktif.'], 404);
        }

        return response()->json($subkategori, 200);
    }
}
