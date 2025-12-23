<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    function login(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);
    
        $user = User::where('email', $request->email)->first();
    
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

         $user->tokens()->delete();
         if ($user->status == 0) {
            return response()->json([
                'message' => 'Akun Anda belum aktif, silakan hubungi pemilik toko.'
            ], 403);
        }
         
    
        return $user->createToken($request->email)->plainTextToken;
    }

    function register(Request $request){
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan pengguna']);
        }

         $request->validate([
            'name'     => 'required|string|max:255',
            'email'    => 'required|string|email|unique:users,email',
            'password' => 'required|string|min:6',
            'alamat'   => 'nullable|string|max:255',
            'role'     => 'required|string|in:partner,karyawan',
        ]);
        User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'alamat'   => $request->alamat,
            'role'     => $request->role,
            'status'   => 1,
        ]);

        return response()->json([
            'message' => 'Register berhasil'
        ], 201);
    }

    function logout(Request $request){
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out from all devices']);
    }

    function changeStatusToZero(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;
            if ($role !== 'pemilik') {
                return response()->json(['message' => 'Anda tidak bisa menambahkan pengguna']);
        }

        

        $user = User::find($id);
        $role = $user->role;
            if ($role == 'pemilik') {
                return response()->json(['message' => 'Anda tidak bisa menonaktifkan Pemilik']);
        }

        if (! $user) {
            return response()->json([
                'message' => 'User tidak ditemukan'
            ], 404);
        }

        $user->status = 0;
        $user->save();

        return response()->json([
            'message' => 'Status user berhasil diubah menjadi nonaktif'
        ], 200);
    }


    function getAllUsers(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengakses data ini']);
        }

        $users = DB::table('v_user')
            ->where('status', 1)
            ->get();

        return response()->json($users, 200);
    }

    function getUserById($id)
    {
        $user = DB::table('v_user')
            ->where('id', $id)
            ->first();

        if (!$user) {
            return response()->json(['message' => 'User tidak ditemukan'], 404);
        }

        return response()->json($user, 200);
    }



                    

    function getMyData(Request $request)
    {
        $user = $request->user();
        $user = DB::table('v_user')
            ->where('id',$user->id,)
            ->first();

        if (!$user) {
            return response()->json(['message' => 'User tidak ditemukan'], 404);
        }

        return response()->json($user, 200);
    }

    
    public function update(Request $request, $id)
{
    $user = $request->user();
    $role = $user->role;

    if ($role !== 'pemilik') {
        return response()->json(['message' => 'Anda tidak bisa mengubah pengguna'], 403);
    }

    $request->validate([
        'name'     => 'sometimes|required|string|max:255',
        'email'    => 'sometimes|required|string|max:255|unique:users,email,' . $id, 
        'password' => 'nullable|string|min:6',
        'alamat'   => 'sometimes|nullable|string|max:255',
        'role'     => 'sometimes|required|string|in:partner,karyawan,pemilik' 
    ]);

    $targetUser = User::find($id);
    if (!$targetUser) {
        return response()->json(['message' => 'Pengguna tidak ditemukan'], 404);
    }

    if ($request->has('name')) {
        $targetUser->name = $request->name;
    }
    if ($request->has('email')) {
        $targetUser->email = $request->email;
    }
    if (!empty($request->password)) {
        $targetUser->password = Hash::make($request->password);
    }
    if ($request->has('alamat')) {
        $targetUser->alamat = $request->alamat;
    }

    if ($request->has('role')) {
        if ($user->id === $targetUser->id) {
            if ($request->role !== 'pemilik') {
                return response()->json(['message' => 'Anda tidak bisa mengubah role anda sendiri'], 403);
            }
        } else {
            if ($request->role === 'pemilik') {
                return response()->json(['message' => 'Tidak bisa mengubah user lain menjadi pemilik'], 403);
            }
            $targetUser->role = $request->role;
        }
    }

    $targetUser->updated_at = now();
    $targetUser->save();

    return response()->json([
        'message' => 'Pengguna berhasil diperbarui'
    ], 200);
}


}
