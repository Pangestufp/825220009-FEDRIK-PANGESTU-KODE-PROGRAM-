<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProfilTokoController extends Controller
{
    public function update(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan pengguna']);
        }

        $request->validate([
            'nama' => 'sometimes|required|string|max:50',
            'alamat' => 'sometimes|required|string|max:50',
            'email' => 'sometimes|required|email|max:50',
            'kontakwa' => 'sometimes|required|string|max:14',
            'persenmitraprofit' => 'sometimes|required|numeric',
            'persenprofitestimasi' => 'sometimes|required|numeric',
        ]);
    
        $data = [];
    
        if ($request->has('nama')) {
            $data['nama'] = $request->nama;
        }
        if ($request->has('alamat')) {
            $data['alamat'] = $request->alamat;
        }
        if ($request->has('email')) {
            $data['email'] = $request->email;
        }
        if ($request->has('kontakwa')) {
            $data['kontakwa'] = $request->kontakwa;
        }
        if ($request->has('persenmitraprofit')) {
            $data['persenmitraprofit'] = $request->persenmitraprofit;
        }
        if ($request->has('persenprofitestimasi')) {
            $data['persenprofitestimasi'] = $request->persenprofitestimasi;
        }
    
        $updated = DB::table('profiltoko')
            ->where('Id_Pemilik', $user->id)
            ->update($data);
    

        if ($updated) {
            return response()->json(['message' => 'Profil toko Pulau Baru berhasil diperbarui'], 200);
        } else {
            return response()->json(['message' => 'Tidak ada perubahan atau data tidak ditemukan.'], 404);
        }
    }

    public function get()
    {

        $profil = DB::table('profiltoko')
            ->first();

        if (!$profil) {
            return response()->json([
                'message' => 'Profil toko tidak ditemukan.'
            ], 404);
        }

        return response()->json($profil, 200);
    }


}
