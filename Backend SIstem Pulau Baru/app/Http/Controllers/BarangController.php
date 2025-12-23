<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;


class BarangController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Barang']);
        }

        if ($request->hasFile('image')) {
            $file = $request->file('image');

            if ($file->getSize() > 2 * 1024 * 1024) {
                return response()->json([
                    'message' => 'Ukuran'
                ], 200);
            }

            $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
            if (!in_array(strtolower($file->getClientOriginalExtension()), $allowedExtensions)) {
                return response()->json([
                    'message' => 'Format'
                ], 200);
            }
        }

        $request->validate([
            'id_varian' => 'required|integer',
            'id_brand' => 'required|integer',
            'deskripsi' => 'required|string|max:100',
            'stok' => 'required|integer',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $barangExists = DB::table('barang')
            ->where('id_varian', $request->id_varian)
            ->where('id_brand', $request->id_brand)
            ->where('status', 1)
            ->exists();

        if ($barangExists) {
            return response()->json([
                'message' => 'Barang dengan varian dan brand tersebut sudah aktif.'
            ], 422);
        }

        $imageLocation = null;

        if ($request->hasFile('image')) {
            $path = Storage::putFile('images', $request->file('image'));
            $imageLocation = 'storage/' . $path;
        } else {
            $imageLocation = null;
        }

        $barangId = DB::table('barang')->insertGetId([
            'id_varian' => $request->id_varian,
            'id_brand' => $request->id_brand,
            'deskripsi' => $request->deskripsi,
            'stok' => $request->stok,
            'status' => 1,
            'imagepath' => $imageLocation,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json([
            'message' => 'Barang berhasil ditambahkan.',
            'id_barang' => $barangId
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Barang']);
        }

        if ($request->hasFile('image')) {
            $file = $request->file('image');

            if ($file->getSize() > 2 * 1024 * 1024) {
                return response()->json([
                    'message' => 'Ukuran'
                ], 200);
            }

            $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
            if (!in_array(strtolower($file->getClientOriginalExtension()), $allowedExtensions)) {
                return response()->json([
                    'message' => 'Format'
                ], 200);
            }
        }

        $request->validate([
            'id_varian' => 'sometimes|integer',
            'id_brand' => 'sometimes|integer',
            'deskripsi' => 'sometimes|string|max:100',
            'stok' => 'sometimes|integer',
            'status' => 'sometimes|integer',
            'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $barang = DB::table('barang')->where('id_barang', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan.'], 404);
        }

        $dataToUpdate = [];

        if ($request->has('deskripsi')) $dataToUpdate['deskripsi'] = $request->deskripsi;
        if ($request->has('stok')) $dataToUpdate['stok'] = $request->stok;
        if ($request->has('status')) $dataToUpdate['status'] = $request->status;

        if ($request->has('id_varian')) $dataToUpdate['id_varian'] = $request->id_varian;
        if ($request->has('id_brand')) $dataToUpdate['id_brand'] = $request->id_brand;

        $imageLocation = null;

        if ($request->hasFile('image')) {
            $path = Storage::putFile('images', $request->file('image'));
            $imageLocation = 'storage/' . $path;
            $dataToUpdate['imagepath'] = $imageLocation;
        }

        if (!empty($dataToUpdate)) {
            $dataToUpdate['updateat'] = Carbon::now();
            DB::table('barang')->where('id_barang', $id)->update($dataToUpdate);
        } else {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        return response()->json(['message' => 'Barang berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Barang']);
        }

        $barang = DB::table('barang')->where('id_barang', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan.'], 404);
        }

        DB::table('barang')->where('id_barang', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Barang berhasil dinonaktifkan.'], 200);
    }

    public function getAll()
    {
        $barang = DB::table('v_barang')->where('status', 1)->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada barang yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function getAllWP()
    {
        $barang = DB::table('v_barangwithprice')->where('status', 1)->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada barang yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

    public function getAllPWP()
    {
        $barang = DB::table('v_barangwithpartprice')->where('status', 1)->orderBy('createat','desc')->get();

        if ($barang->isEmpty()) {
            return response()->json(['message' => 'Tidak ada barang yang ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }


    public function getById($id)
    {
        $barang = DB::table('v_barang')->where('id_barang', $id)->first();

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan.'], 404);
        }

        return response()->json($barang, 200);
    }

}