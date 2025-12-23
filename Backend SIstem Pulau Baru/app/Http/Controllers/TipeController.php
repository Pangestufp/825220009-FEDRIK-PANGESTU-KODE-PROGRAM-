<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class TipeController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan Tipe']);
        }

        $request->validate([
            'namatipe' => 'required|string|max:50',
        ]);

        $tipeExists = DB::table('tipe')
            ->where('namatipe', $request->namatipe)
            ->where('status', 1)
            ->exists();

        if ($tipeExists) {
            return response()->json([
                'message' => 'Tipe dengan nama tersebut sudah aktif.'
            ], 422);
        }
        

        DB::table('tipe')->insert([
            'namatipe' => $request->namatipe,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Tipe berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id)
    {
        
        $user = $request->user();
        $role = $user->role;

        if($id == 1){
            return response()->json(['message' => 'Tipe ini tidak bisa diperbarui.'], 200);
        }

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Tipe']);
        }

        $request->validate([
            'namatipe' => 'sometimes|required|string|max:50',
        ]);


        $data = [];
        if ($request->has('namatipe')) {
            $data['namatipe'] = $request->namatipe;
        }

        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        DB::table('tipe')->where('id_tipe', $id)->update($data);

        return response()->json(['message' => 'Tipe berhasil diperbarui.'], 200);
    }

    public function updateStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;

        if($id == 1){
            return response()->json(['message' => 'Tipe ini tidak bisa diperbarui.'], 200);
        }

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah Tipe']);
        }

        $tipe = DB::table('tipe')->where('id_tipe', $id)->first();

        if (!$tipe) {
            return response()->json(['message' => 'Tipe tidak ditemukan.'], 404);
        }

        DB::table('tipe')->where('id_tipe', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Tipe berhasil dinonaktifkan.'], 200);
    }

    public function getAll()
    {
        $tipe = DB::table('tipe')->where('status', 1)->orderBy('createat','desc')->get();

        if ($tipe->isEmpty()) {
            return response()->json(['message' => 'Tidak ada tipe yang aktif.'], 404);
        }

        return response()->json($tipe, 200);
    }

    public function getById($id)
    {
        $tipe = DB::table('tipe')->where('id_tipe', $id)->first();

        if (!$tipe) {
            return response()->json(['message' => 'Tipe tidak ditemukan.'], 404);
        }

        return response()->json($tipe, 200);
    }
}
