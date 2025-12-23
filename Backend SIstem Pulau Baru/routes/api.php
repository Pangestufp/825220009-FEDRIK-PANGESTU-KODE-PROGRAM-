<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\BarangReturController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\FakturPembelianController;
use App\Http\Controllers\HargaBarangController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\LaporanKeuanganController;
use App\Http\Controllers\PerusahaanController;
use App\Http\Controllers\PesananPartnerController;
use App\Http\Controllers\PrediksiController;
use App\Http\Controllers\ProfilTokoController;
use App\Http\Controllers\SatuanController;
use App\Http\Controllers\StokOpNameController;
use App\Http\Controllers\SubKategoriController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\TipeController;
use App\Http\Controllers\UkuranController;
use App\Http\Controllers\VarianController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//user manajemen
Route::prefix('/Auth')->group(function(){
    Route::post('/Login', [AuthController::class, 'login']);
    Route::post('/Register', [AuthController::class, 'register'])->middleware('auth:sanctum');
    Route::post('/Logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
});
Route::prefix('/Pengguna')->group(function(){
    Route::patch('/UpdateStatus/{id}', [AuthController::class, 'changeStatusToZero'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [AuthController::class, 'update'])->middleware('auth:sanctum');
    Route::get('/GetAll', [AuthController::class, 'getAllUsers'])->middleware('auth:sanctum');
    Route::get('/GetMyData', [AuthController::class, 'getMyData'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [AuthController::class, 'getUserById'])->middleware('auth:sanctum');
});
Route::prefix('/ProfilToko')->group(function(){
    Route::patch('/Update', [ProfilTokoController::class, 'Update'])->middleware('auth:sanctum');
    Route::get('/Get', [ProfilTokoController::class, 'get'])->middleware('auth:sanctum');
});
Route::prefix('/Perusahaan')->group(function(){
    Route::post('/Create', [PerusahaanController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [PerusahaanController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [PerusahaanController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [PerusahaanController::class, 'readAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [PerusahaanController::class, 'readById'])->middleware('auth:sanctum');
});

Route::prefix('/Supplier')->group(function(){
    Route::post('/Create', [SupplierController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [SupplierController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [SupplierController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [SupplierController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [SupplierController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Kategori')->group(function(){
    Route::post('/Create', [KategoriController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [KategoriController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [KategoriController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [KategoriController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [KategoriController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/SubKategori')->group(function(){
    Route::post('/Create', [SubKategoriController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [SubKategoriController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [SubKategoriController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [SubKategoriController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [SubKategoriController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Brand')->group(function(){
    Route::post('/Create', [BrandController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [BrandController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [BrandController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [BrandController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [BrandController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Satuan')->group(function(){
    Route::post('/Create', [SatuanController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [SatuanController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [SatuanController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [SatuanController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [SatuanController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Ukuran')->group(function(){
    Route::post('/Create', [UkuranController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [UkuranController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [UkuranController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [UkuranController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [UkuranController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Varian')->group(function(){
    Route::post('/Create', [VarianController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [VarianController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [VarianController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [VarianController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [VarianController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Tipe')->group(function(){
    Route::post('/Create', [TipeController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [TipeController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [TipeController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [TipeController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [TipeController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Barang')->group(function(){
    Route::post('/Create', [BarangController::class, 'create'])->middleware('auth:sanctum');
    Route::post('/Update/{id}', [BarangController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id}', [BarangController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadAll', [BarangController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/ReadAllWithPrice', [BarangController::class, 'getAllWP'])->middleware('auth:sanctum');
    Route::get('/ReadAllWithPartnerPrice', [BarangController::class, 'getAllPWP'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id}', [BarangController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/HargaBarang')->group(function(){
    Route::post('/Create', [HargaBarangController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id_barang}/{id_pararel}', [HargaBarangController::class, 'update'])->middleware('auth:sanctum');
    Route::patch('/UpdateStatus/{id_barang}/{id_pararel}', [HargaBarangController::class, 'updateStatusToZero'])->middleware('auth:sanctum');
    Route::get('/ReadByIdBarangByIDPararel/{id_barang}/{id_pararel}', [HargaBarangController::class, 'getByIdBarangIdPararel'])->middleware('auth:sanctum');
    Route::get('/ReadById/{id_barang}', [HargaBarangController::class, 'getByIdBarang'])->middleware('auth:sanctum');
});

//Fitur kelola stok

Route::prefix('/KelolaStok')->group(function(){
    Route::post('/CekOpName', [StokOpNameController::class, 'cekOpname'])->middleware('auth:sanctum');
    Route::post('/Koreksi', [StokOpNameController::class, 'koreksiStok'])->middleware('auth:sanctum');
    Route::get('/GetAll', [StokOpNameController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [StokOpNameController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/TambahFaktur')->group(function(){
    Route::post('/Create', [FakturPembelianController::class, 'create'])->middleware('auth:sanctum');
    Route::patch('/Update/{id}', [FakturPembelianController::class, 'update'])->middleware('auth:sanctum');
    Route::get('/GetAll', [FakturPembelianController::class, 'getall'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [FakturPembelianController::class, 'getbyid'])->middleware('auth:sanctum');
    Route::get('/GetDetailById/{id}', [FakturPembelianController::class, 'getdetailbyid'])->middleware('auth:sanctum');
});

Route::prefix('/TambahBarangKeluar')->group(function(){
    Route::post('/Create', [BarangKeluarController::class, 'create'])->middleware('auth:sanctum');
    Route::get('/GetAll', [BarangKeluarController::class, 'getall'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [BarangKeluarController::class, 'getbyid'])->middleware('auth:sanctum');
    Route::get('/GetDetailById/{id}', [BarangKeluarController::class, 'getdetailbyid'])->middleware('auth:sanctum');
});

Route::prefix('/ReturBarang')->group(function(){
    Route::post('/Create', [BarangReturController::class, 'create'])->middleware('auth:sanctum');
    Route::get('/GetAll', [BarangReturController::class, 'getall'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [BarangReturController::class, 'getbyid'])->middleware('auth:sanctum');
    Route::get('/GetDetailById/{id}', [BarangReturController::class, 'getDetailById'])->middleware('auth:sanctum');
    Route::get('/GetAvaiById/{id}', [BarangReturController::class, 'getAvailable'])->middleware('auth:sanctum');
});

Route::prefix('/Pesanan')->group(function(){
    Route::post('/Create', [PesananPartnerController::class, 'create'])->middleware('auth:sanctum');
    Route::post('/Tolak/{id}', [PesananPartnerController::class, 'updateTolak'])->middleware('auth:sanctum');
    Route::post('/Setuju/{id}', [PesananPartnerController::class, 'updateSetuju'])->middleware('auth:sanctum');
    Route::post('/Selesai/{id}', [PesananPartnerController::class, 'updateSelesai'])->middleware('auth:sanctum');
    Route::post('/Review/{id}', [PesananPartnerController::class, 'updateReturn'])->middleware('auth:sanctum');
    Route::get('/GetAll', [PesananPartnerController::class, 'getAll'])->middleware('auth:sanctum');
    Route::get('/GetByUser', [PesananPartnerController::class, 'getAllByIDUser'])->middleware('auth:sanctum');
    Route::get('/GetById/{id}', [PesananPartnerController::class, 'getById'])->middleware('auth:sanctum');
});

Route::prefix('/Laporan')->group(function(){
    Route::get('/Create', [LaporanKeuanganController::class, 'exportPdfWithChart']);
    Route::get('/GetData', [LaporanKeuanganController::class, 'getLaporan'])->middleware('auth:sanctum');
    Route::get('/GetLog', [LaporanKeuanganController::class, 'getLog'])->middleware('auth:sanctum');
    Route::post('/Insert', [LaporanKeuanganController::class, 'inputOmsetManual'])->middleware('auth:sanctum');
});

Route::prefix('/Prediksi')->group(function(){
    Route::get('/Get', [PrediksiController::class, 'cekStokPrediksi']);
});


