<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class UkuranController extends Controller
{

    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Ukuran']);
        }

        $request->validate([
            'id_satuan' => 'required|integer',
            'ukuran' => 'required|integer',
        ]);

        $ukuranExists = DB::table('ukuran')
            ->where('id_satuan', $request->id_satuan)
            ->where('ukuran', $request->ukuran)
            ->where('status', 1)
            ->exists();

        if ($ukuranExists) {
            return response()->json([
                'message' => 'Ukuran dengan satuan tersebut sudah aktif.'
            ], 422);
        }

        DB::table('ukuran')->insert([
            'id_satuan' => $request->id_satuan,
            'ukuran' => $request->ukuran,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Data ukuran berhasil ditambahkan.'], 201);
    }


    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Ukuran']);
        }

        $request->validate([
            'id_satuan' => 'sometimes|required|integer',
            'ukuran' => 'sometimes|required|integer',
        ]);

        

        $data = [];

        if ($request->has('id_satuan')) {
            $data['id_satuan'] = $request->id_satuan;
        }
        if ($request->has('ukuran')) {
            $data['ukuran'] = $request->ukuran;
        }

        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }
        

        $data['updateat'] = Carbon::now();

        DB::table('ukuran')->where('id_ukuran', $id)->update($data);

        return response()->json(['message' => 'Data ukuran berhasil diperbarui.'], 200);
    }


    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Ukuran']);
        }

        $ukuran = DB::table('ukuran')->where('id_ukuran', $id)->first();

        if (!$ukuran) {
            return response()->json(['message' => 'Ukuran tidak ditemukan.'], 404);
        }

        DB::table('ukuran')->where('id_ukuran', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status ukuran berhasil diubah menjadi nonaktif.'], 200);
    }

    public function getAll()
    {
        $ukuran = DB::table('v_ukuran')->where('status', 1)->orderBy('createat','desc')->get();

        if ($ukuran->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data ukuran ditemukan.'], 404);
        }

        return response()->json($ukuran, 200);
    }

    public function getById($id)
    {
        $ukuran = DB::table('v_ukuran')->where('id_ukuran', $id)->first();

        if (!$ukuran) {
            return response()->json(['message' => 'Ukuran tidak ditemukan.'], 404);
        }

        return response()->json($ukuran, 200);
    }
}
