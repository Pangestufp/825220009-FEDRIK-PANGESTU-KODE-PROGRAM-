<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class StokOpNameController extends Controller
{
    public function cekOpname(Request $request)
    {
        $user = $request->user();
        $role = $user->role;
        if ($role == 'partner') {
            return response()->json(['message' => 'Anda tidak bisa mengakses fitur ini']);
        }

        $opnameData = $request->input('opname');
        $hasil = [];

        foreach ($opnameData as $item) {
            $idBarang = $item['id_barang'];
            $stokInput = $item['stokinput'];

            if ($stokInput < 0) {
                continue;
            }

            $barang = DB::table('v_barang')
                ->where('id_barang', $idBarang)
                ->first();

            if ($barang) {
                $stokSistem = $barang->stok;

                if ($stokSistem != $stokInput) {
                    $hasil[] = [
                        'id_barang'    => $barang->id_barang,
                        'namatext'     => $barang->namatext,
                        'imagepath'    => $barang->imagepath,
                        'jumlahsistem' => $stokSistem,
                        'jumlahinput'  => $stokInput,
                        'selisih'      => $stokInput - $stokSistem
                    ];
                }
            }
        }

        return response()->json($hasil);
    }

    // public function koreksiStok(Request $request)
    // {
    //     $user = $request->user();
    //     $role = $user->role;
    //     if ($role == 'partner') {
    //         return response()->json(['message' => 'Anda tidak bisa mengakses fitur ini']);
    //     }

    //     $koreksiData = $request->input('koreksi');
    //     $alasan = $request->input('alasan');
    //     $logList = [];

    //     foreach ($koreksiData as $item) {
    //         $idBarang = $item['id_barang'];
    //         $stokInput = $item['stokinput'];

            
    //         if ($stokInput < 0) {
    //             continue;
    //         }

    //         $barang = DB::table('v_barang')
    //             ->where('id_barang', $idBarang)
    //             ->first();

    //         if ($barang) {
    //             $sebelum = $barang->stok;
    //             $sesudah = $stokInput;

    //             $logList[] = [
    //                 'id_barang' => $barang->id_barang,
    //                 'namatext'  => $barang->namatext,
    //                 'sebelum'   => $sebelum,
    //                 'sesudah'   => $sesudah
    //             ];

    //             DB::table('barang')
    //                 ->where('id_barang', $idBarang)
    //                 ->update(['stok' => $stokInput]);
    //         }
    //     }

    //     if (!empty($logList)) {
    //         DB::table('logperubahan')->insert([
    //             'data_json' => json_encode($logList),
    //             'alasan'   => $alasan,
    //             'id_user'   => $user->id,
    //             'createat' => Carbon::now()
    //         ]);
    //     }

    //     return response()->json([
    //         'message' => 'Koreksi stok berhasil disimpan'
    //     ]);
    // }

    public function koreksiStok(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role == 'partner') {
            return response()->json(['message' => 'Anda tidak bisa mengakses fitur ini']);
        }

        $koreksiData = $request->input('koreksi');
        $alasan = $request->input('alasan');

        DB::beginTransaction();

        try {

            $idLog = DB::table('logperubahan')->insertGetId([
                'alasan'   => $alasan,
                'id_user'  => $user->id,
                'createat' => Carbon::now()
            ]);

            foreach ($koreksiData as $item) {

                $idBarang = $item['id_barang'];
                $stokInput = $item['stokinput'];

                if ($stokInput < 0) {
                    continue;
                }

                $barang = DB::table('v_barang')
                    ->where('id_barang', $idBarang)
                    ->first();

                if ($barang) {
                    $sebelum = $barang->stok;
                    $sesudah = $stokInput;

                    DB::table('barang')
                        ->where('id_barang', $idBarang)
                        ->update(['stok' => $stokInput]);

                    DB::table('detailperubahan')->insert([
                        'id_logperubahan' => $idLog,
                        'id_barang'       => $idBarang,
                        'sebelum'         => $sebelum,
                        'sesudah'         => $sesudah
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Koreksi stok berhasil disimpan'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'message' => 'Terjadi kesalahan: ' . $e->getMessage()
            ], 500);
        }
    }


     public function getAll()
    {
        $log = DB::table('v_logperubahan')->get();

        if ($log->isEmpty()) {
            return response()->json(['message' => 'Tidak ada log perubahan yang ditemukan.'], 404);
        }

        return response()->json($log, 200);
    }

    // public function getById($id)
    // {
    //     $log = DB::table('logperubahan')
    //         ->where('id_logperubahan', $id)
    //         ->first();

    //     if (!$log) {
    //         return response()->json(['message' => 'Log tidak ditemukan.'], 404);
    //     }
        
    //     $log->data_json = json_decode($log->data_json);

    //     return response()->json($log, 200);
    // }

    public function getById($id)
    {
        $log = DB::table('logperubahan')
            ->where('id_logperubahan', $id)
            ->first();

        if (!$log) {
            return response()->json(['message' => 'Log tidak ditemukan.'], 404);
        }

        $detail = DB::table('detailperubahan as d')
            ->join('v_barang as b', 'd.id_barang', '=', 'b.id_barang')
            ->select(
                'd.id_barang',
                'b.namatext',
                'd.sebelum',
                'd.sesudah'
            )
            ->where('d.id_logperubahan', $id)
            ->get();

        $log->data_json = $detail;

        return response()->json($log, 200);
    }


}
