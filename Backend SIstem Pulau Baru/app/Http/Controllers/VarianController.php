<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class VarianController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Varian']);
        }

        $request->validate([
            'id_ukuran' => 'required|integer',
            'id_subkategori' => 'required|integer',
        ]);

        $exists = DB::table('varian')
            ->where('id_subkategori', $request->id_subkategori)
            ->where('id_ukuran', $request->id_ukuran)
            ->where('status', 1)
            ->exists();

        if ($exists) {
            return response()->json(['message' => 'Varian dengan subkategori dan ukuran tersebut sudah aktif dan tidak bisa ditambahkan lagi.'], 422);
        }

        DB::table('varian')->insert([
            'id_ukuran' => $request->id_ukuran,
            'id_subkategori' => $request->id_subkategori,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Varian berhasil ditambahkan.'], 201);
    }


    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Varian']);
        }

        $request->validate([
            'id_ukuran' => 'sometimes|required|integer',
            'id_subkategori' => 'sometimes|required|integer',
        ]);

        $varian = DB::table('varian')->where('id_varian', $id)->first();

        if (!$varian) {
            return response()->json(['message' => 'Varian tidak ditemukan.'], 404);
        }

        $data = [];

        if ($request->has('id_subkategori')) {
            $data['id_subkategori'] = $request->id_subkategori;
        }
        if ($request->has('id_ukuran')) {
            $data['id_ukuran'] = $request->id_ukuran;
        }
        
        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('varian')->where('id_varian', $id)->update($data);

        return response()->json(['message' => 'Varian berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Varian']);
        }

        $varian = DB::table('varian')->where('id_varian', $id)->first();

        if (!$varian) {
            return response()->json(['message' => 'Varian tidak ditemukan.'], 404);
        }
        

        DB::table('varian')->where('id_varian', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status varian telah diubah menjadi non-aktif.'], 200);
    }

    public function getAll()
    {
        $varian = DB::table('v_varian')->where('status', 1)->orderBy('createat','desc')->get();

        if ($varian->isEmpty()) {
            return response()->json(['message' => 'Tidak ada varian aktif ditemukan.'], 404);
        }

        return response()->json($varian, 200);
    }

    public function getById($id)
    {
        $varian = DB::table('v_varian')->where('id_varian', $id)->first();

        if (!$varian) {
            return response()->json(['message' => 'Varian tidak ditemukan atau sudah tidak aktif.'], 404);
        }

        return response()->json($varian, 200);
    }
}
