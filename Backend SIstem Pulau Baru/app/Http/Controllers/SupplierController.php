<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class SupplierController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa menambahkan supplier']);
        }

        $request->validate([
            'id_perusahaan' => 'required|integer',
            'namasupplier' => 'required|string|max:50',
            'kontak' => 'required|string|max:14',
        ]);

        $supplierExists = DB::table('supplier')
            ->where('id_perusahaan', $request->id_perusahaan)
            ->where('namasupplier', $request->namasupplier)
            ->where('status', 1)
            ->exists();

        if ($supplierExists) {
            return response()->json([
                'message' => 'Supplier dengan nama tersebut sudah aktif pada perusahaan ini.'
            ], 422);
        }

        DB::table('supplier')->insert([
            'id_perusahaan' => $request->id_perusahaan,
            'namasupplier' => $request->namasupplier,
            'status' => 1,
            'kontak' => $request->kontak,
            'createat' => Carbon::now(),
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Supplier berhasil ditambahkan.'], 201);
    }

    public function update(Request $request, $id)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah supplier']);
        }

        $request->validate([
            'id_perusahaan' => 'sometimes|required|integer',
            'namasupplier' => 'sometimes|required|string|max:50',
            'kontak' => 'sometimes|required|string|max:14',
        ]);

        $data = [];

        if ($request->has('id_perusahaan')) {
            $data['id_perusahaan'] = $request->id_perusahaan;
        }
        if ($request->has('namasupplier')) {
            $data['namasupplier'] = $request->namasupplier;
        }
        if ($request->has('kontak')) {
            $data['kontak'] = $request->kontak;
        }

        if (empty($data)) {
            return response()->json(['message' => 'Tidak ada data untuk diperbarui.'], 400);
        }

        $data['updateat'] = Carbon::now();

        $updated = DB::table('supplier')->where('id_supplier', $id)->update($data);

        if ($updated) {
            return response()->json(['message' => 'Supplier berhasil diperbarui.'], 200);
        } else {
            return response()->json(['message' => 'Tidak ada perubahan pada data supplier.'], 200);
        }
    }

    public function updateStatusToZero(Request $request, $id){
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa mengubah supplier']);
        }

        DB::table('supplier')->where('id_supplier', $id)->update([
            'status' => 0,
            'updateat' => Carbon::now(),
        ]);

        return response()->json(['message' => 'Status supplier telah diubah menjadi non-aktif.'], 200);
    }

    public function getAll()
    {
        $suppliers = DB::table('v_supplier')->where('status', 1)->orderBy('createat','desc')->get();

        if ($suppliers->isEmpty()) {
            return response()->json(['message' => 'Tidak ada supplier aktif ditemukan.'], 404);
        }

        return response()->json($suppliers, 200);
    }

    public function getById($id)
    {
        $supplier = DB::table('v_supplier')->where('id_supplier', $id)->first();

        if (!$supplier) {
            return response()->json(['message' => 'Supplier tidak ditemukan atau sudah tidak aktif.'], 404);
        }

        return response()->json($supplier, 200);
    }
}
