<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;

class LaporanKeuanganController extends Controller
{

    
    public function exportPdfWithChart(Request $request)
    {
        $tahun = $request->tahun;
        $bulanAwal = $request->bulan_awal;
        $bulanAkhir = $request->bulan_akhir;

        $start = "{$tahun}-" . str_pad($bulanAwal, 2, '0', STR_PAD_LEFT);
        $end = "{$tahun}-" . str_pad($bulanAkhir, 2, '0', STR_PAD_LEFT);

        $laporan = DB::table('laporan')
            ->select('waktu', 'cashflowin', 'cashflowout', 'lababersih')
            ->whereBetween('waktu', [$start, $end])
            ->get();

        if ($laporan->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data laporan untuk periode tersebut.'], 404);
        }

        $labels = $laporan->pluck('waktu')->toArray();
        $cashflowIn = $laporan->pluck('cashflowin')->toArray();
        $cashflowOut = $laporan->pluck('cashflowout')->toArray();
        $labaBersih = $laporan->pluck('lababersih')->toArray();

        $chartData = [
            'type' => 'line',
            'data' => [
                'labels' => $labels,
                'datasets' => [
                    ['label' => 'Uang Masuk', 'data' => $cashflowIn, 'borderColor' => 'green', 'fill' => false],
                    ['label' => 'Uang Keluar', 'data' => $cashflowOut, 'borderColor' => 'red', 'fill' => false],
                    ['label' => 'Laba Bersih', 'data' => $labaBersih, 'borderColor' => 'orange', 'fill' => false],
                ]
            ],
            'options' => [
                'plugins' => [
                    'legend' => [
                        'display' => true
                    ]
                ]
            ]
        ];

        $chartUrl = 'https://quickchart.io/chart?c=' . urlencode(json_encode($chartData));
        
        $ch = curl_init($chartUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $chartImage = curl_exec($ch);
        curl_close($ch);
        
        $chartBase64 = base64_encode($chartImage);

        $pdf = Pdf::loadView('laporan.pdf', [
            'laporan' => $laporan,
            'chartBase64' => $chartBase64
        ])->setOptions([
            'isHtml5ParserEnabled' => true,
            'isPhpEnabled' => false,
            'isRemoteEnabled' => true,
            'defaultFont' => 'DejaVu Sans',
            'dpi' => 150,
            'enable_php' => false,
            'chroot' => realpath(base_path()),
        ])->setPaper('a4', 'portrait');

        $fileName = "Laporan_{$start}_to_{$end}.pdf";
        return $pdf->download($fileName);
    }

    public function getLaporan(Request $request)
    {
        $tahun = $request->tahun;
        $bulanAwal = $request->bulan_awal;
        $bulanAkhir = $request->bulan_akhir;

        if (!$tahun || !$bulanAwal || !$bulanAkhir) {
            return response()->json(['message' => 'Parameter tahun, bulan_awal, dan bulan_akhir wajib diisi.'], 400);
        }

        $start = "{$tahun}-" . str_pad($bulanAwal, 2, '0', STR_PAD_LEFT);
        $end = "{$tahun}-" . str_pad($bulanAkhir, 2, '0', STR_PAD_LEFT);

        $laporan = DB::table('laporan')
            ->select('waktu', 'cashflowin', 'cashflowout', 'freecashflow', 'lababersih')
            ->whereBetween('waktu', [$start, $end])
            ->get();

        if ($laporan->isEmpty()) {
            return response()->json(['message' => 'Tidak ada data laporan untuk periode tersebut.'], 404);
        }

        return response()->json($laporan, 200);
    }


    public function inputOmsetManual(Request $request)
    {
        $user = $request->user();
        $role = $user->role;

        if ($role !== 'pemilik') {
            return response()->json(['message' => 'Anda tidak bisa memasukan omset'], 200);
        }
        $request->validate([
            'omsetinput' => 'required|numeric|min:0',
        ]);

        $omsetInput = $request->omsetinput;
        $idLog = Carbon::now()->format('Ymd');

        DB::beginTransaction();
        try {
            $log = DB::table('logpenjualanharian')
                ->where('idlogpenjualan', $idLog)
                ->lockForUpdate()
                ->first();

            $profil = DB::table('profiltoko')->first();
            $persenRaw = $profil ? (float) $profil->persenprofitestimasi : 0.0;
            $persenProfit = ($persenRaw > 1) ? ($persenRaw / 100.0) : $persenRaw;

            if (!$log) {
                DB::table('logpenjualanharian')->insert([
                    'idlogpenjualan'      => $idLog,
                    'id_user'             => $user->id,
                    'omsetinput'          => $omsetInput,
                    'totalhitungansistem' => 0,
                    'keuntungansistem'    => 0,
                    'totalomset'          => $omsetInput,
                    'totalkeuntungan'     => ($omsetInput * $persenProfit),
                    'createat'            => Carbon::now(),
                    'updateat'            => Carbon::now(),
                ]);
            } else {
                $omsetSistem  = $log->totalhitungansistem;
                $profitSistem = $log->keuntungansistem;

                // jika kasir kurang maka rugi kalau 0 berarti full sistem
                if($omsetInput==0){
                    $totalKeuntunganBaru = $profitSistem;
                }else if ($omsetInput < $omsetSistem) {

                    $selisih = $omsetSistem - $omsetInput;
                    $profitReal = $omsetInput * $persenProfit;

                    // keuntungan real
                    $totalKeuntunganBaru = $profitReal - $selisih;

                } 
                // jika kasir lebih maka profit tambahan (lupa catat)
                else if ($omsetInput > $omsetSistem) {

                    $selisih = $omsetInput - $omsetSistem; // penjualan yang tidak tercatat
                    $profitTambahan = $selisih * $persenProfit;

                    $totalKeuntunganBaru = $profitSistem + $profitTambahan;

                } 
                else {

                    $totalKeuntunganBaru = $profitSistem;
                }

                DB::table('logpenjualanharian')
                    ->where('idlogpenjualan', $idLog)
                    ->update([
                        'omsetinput'      => $omsetInput,
                        'totalomset'      => $omsetInput,
                        'totalkeuntungan' => $totalKeuntunganBaru,
                        'updateat'        => Carbon::now(),
                    ]);
            }

            DB::commit();

            return response()->json([
                'message' => 'Omset berhasil diperbarui.'
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }


    public function getLog()
    {
        $idLog = Carbon::now()->format('Ymd');

        $log = DB::table('logpenjualanharian')
            ->where('idlogpenjualan', $idLog)
            ->lockForUpdate()
            ->first();


        if (!$log) {
            return response()->json(['message' => 'Log belum dibuat.'], 404);
        }

        return response()->json($log, 200);
    }

}
