<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class PerusahaanController extends Controller
{
    public function create(Request $request){
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan perusahaan']);
        }

        $request->validate([
            'namaperusahaan' => 'required|string|max:50',
            'deskripsi' => 'required|string|max:200',
            'kontak' => 'required|string|max:14',
            'alamat' => 'required|string|max:50',
        ]);

        $perusahaanExists = DB::table('perusahaan')
            ->where('namaperusahaan', $request->namaperusahaan)
            ->where('status', 1)
            ->exists();

        if ($perusahaanExists) {
            return response()->json([
                'message' => 'Perusahaan dengan nama tersebut sudah aktif.'
            ], 422);
        }
        
        DB::table('perusahaan')->insert([
            'namaperusahaan' => $request->namaperusahaan,
            'deskripsi' => $request->deskripsi,
            'kontak' => $request->kontak,
            'alamat' => $request->alamat,
            'status' => 1,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);
       
    
        return response()->json(['message' => 'Perusahaan berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id){

    $user = $request->user();
    $role = $user->role;

    if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah perusahaan']);
    }

    $request->validate([
        'namaperusahaan' => 'sometimes|required|string|max:50',
        'deskripsi' => 'sometimes|required|string|max:200',
        'kontak' => 'sometimes|required|string|max:14',
        'alamat' => 'sometimes|required|string|max:50',
    ]);
 
    $data = [];
 
    if ($request->has('namaperusahaan')) {
        $data['namaperusahaan'] = $request->namaperusahaan;
    }
    if ($request->has('deskripsi')) {
        $data['deskripsi'] = $request->deskripsi;
    }
    if ($request->has('kontak')) {
        $data['kontak'] = $request->kontak;
    }
    if ($request->has('alamat')) {
        $data['alamat'] = $request->alamat;
    }

    if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

    $data['updateat'] = Carbon::now();
 
    $updated = DB::table('perusahaan')
        ->where('id_perusahaan', $id)
        ->update($data);

    if ($updated) {
        return response()->json(['message' => 'Perusahaan berhasil diperbarui.'], 200);
    } else {
        return response()->json(['message' => 'Data tidak ditemukan atau tidak ada perubahan.'], 404);
    }
}

public function updateStatusToZero(Request $request,$id)
{
    $user = $request->user();
    $role = $user->role;

    if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah perusahaan']);
    }

    $updated = DB::table('perusahaan')
        ->where('id_perusahaan', $id)
        ->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);
 
    if ($updated) {
        return response()->json(['message' => 'Perusahaan berhasil dinonaktifkan.'], 200);
    } else {
        return response()->json(['message' => 'Data perusahaan tidak ditemukan.'], 404);
    }
}

public function readAll()
{
    $perusahaan = DB::table('perusahaan')->where('status', 1)->orderBy('createat','desc')->get();
    if ($perusahaan->isEmpty()) {
        return response()->json(['message' => 'Tidak ada perusahaan aktif ditemukan.'], 404);
    }
    return response()->json($perusahaan, 200);
}


public function readById($id)
{
    $perusahaan = DB::table('perusahaan')->where('id_perusahaan', $id)->first();
    if (!$perusahaan) {
        return response()->json(['message' => 'Perusahaan tidak ditemukan.'], 404);
    }
    return response()->json($perusahaan, 200);
}



}
