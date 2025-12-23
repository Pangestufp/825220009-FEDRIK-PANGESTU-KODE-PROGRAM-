<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class PrediksiController extends Controller
{
    public function cekStokPrediksi()
    {
        $prediksiData = Cache::remember('prediksi_data', 86400, function () {
            $response = Http::get('http://127.0.0.1:9000/PrediksiGetAll');
            return $response->json();
        });

        $peringatan = [];

        $prediksiIds = collect($prediksiData)->pluck('id_barang')->toArray();

        foreach ($prediksiData as $data) {
            $idBarang = $data['id_barang'];
            $namaBarang = $data['nama_barang'];
            $bulanPrediksi = $data['bulan_prediksi'];
            $prediksi = $data['prediksi'];
            $total = $data['total'];

            $barang = DB::table('v_barangwithprice')
                ->where('id_barang', $idBarang)
                ->where('status', 1)
                ->select('stok', 'namatext')
                ->first();

            if (!$barang) {
                continue;
            }

            $stok = $barang->stok;
            $namatext = $barang->namatext ?? $namaBarang;

            if ($stok > $total) {
                continue;
            }

            if ($stok == 0) {
                $peringatan[] = ['data' => "$namatext telah habis _ - _ - "];
                continue;
            }

            if ($stok > $prediksi[0] + $prediksi[1]) {
                $peringatan[] = ['data' => "$namatext (sisa: $stok)_Habis pada {$bulanPrediksi[2]} _Dengan total penjualan $total"];
            } elseif ($stok > $prediksi[0]) {
                $sisa = $total - $prediksi[2];
                $peringatan[] = ['data' => "$namatext (sisa: $stok)_Habis pada {$bulanPrediksi[1]} _Dengan total penjualan $sisa"];
            } else {
                $sisa = $total - $prediksi[1] - $prediksi[2];
                $peringatan[] = ['data' => "$namatext (sisa: $stok)_Habis pada {$bulanPrediksi[0]} _Dengan penjualan $sisa"];
            }
        }

        $barangTanpaPrediksi = DB::table('v_barangwithprice')
            ->where('status', 1)
            ->where('stok', 0)
            ->whereNotIn('id_barang', $prediksiIds)
            ->select('namatext')
            ->get();

        foreach ($barangTanpaPrediksi as $b) {
            $peringatan[] = ['data' => "{$b->namatext} telah habis _ - _ - "];
        }

        return response()->json(
            $peringatan
        );
    }
}
