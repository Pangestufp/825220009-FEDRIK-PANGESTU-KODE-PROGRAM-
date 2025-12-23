<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class SatuanController extends Controller
{

    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Satuan']);
        }

        $request->validate([
            'namasatuan' => 'required|string|max:25',
        ]);

        $satuanExists = DB::table('satuan')
            ->where('namasatuan', $request->namasatuan)
            ->where('status', 1)
            ->exists();

        if ($satuanExists) {
            return response()->json([
                'message' => 'Satuan dengan nama tersebut sudah aktif.'
            ], 422);
        }

        DB::table('satuan')->insert([
            'namasatuan' => $request->namasatuan,
            'status' =>  1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Data satuan berhasil ditambahkan.'], 201);
    }


    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Satuan']);
        }

        $request->validate([
            'namasatuan' => 'sometimes|required|string|max:25',
        ]);

        $data = [];

        if ($request->has('namasatuan')) {
            $data['namasatuan'] = $request->namasatuan;
        }

        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('satuan')->where('id_satuan', $id)->update($data);

        return response()->json(['message' => 'Data satuan berhasil diperbarui.'], 200);
    }


    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Satuan']);
        }

        $satuan = DB::table('satuan')->where('id_satuan', $id)->first();

        if (!$satuan) {
            return response()->json(['message' => 'Satuan tidak ditemukan.'], 404);
        }

        DB::table('satuan')->where('id_satuan', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status satuan berhasil diubah menjadi nonaktif.'], 200);
    }

    public function getAll()
    {
        $satuans = DB::table('satuan')->where('status', 1)->orderBy('createat','desc')->get();

        if ($satuans->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data satuan ditemukan.'], 404);
        }

        return response()->json($satuans, 200);
    }

    public function getById($id)
    {
        $satuan = DB::table('satuan')->where('id_satuan', $id)->first();

        if (!$satuan) {
            return response()->json(['message' => 'Satuan tidak ditemukan.'], 404);
        }

        return response()->json($satuan, 200);
    }
}
