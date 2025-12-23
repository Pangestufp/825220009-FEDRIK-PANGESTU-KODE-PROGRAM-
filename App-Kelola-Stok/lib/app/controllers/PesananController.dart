import 'package:aplikasiinventorytokopulaubaru/app/services/BarangKeluarService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/PesananService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {

  final PesananService _pesananService = PesananService();
  final BarangKeluarService _barangKeluarService = BarangKeluarService();
  var barangList = <dynamic>[].obs;
  var pesananList = <dynamic>[].obs;
  var cartList = <dynamic>[].obs;
  var isLoading = false.obs;

  var selectedid_transaksi = Rxn<String>();

  var pesananDetail = Rxn<Map<String, dynamic>>();


  @override
  void onInit() {
    super.onInit();
    fetchbarang();
  }

  Future<void> fetchpesananById() async {
    String? id = selectedid_transaksi.value;
    if(id!=null) {
      try {
        isLoading.value = true;
        final pesanan = await _pesananService.getPesananById(id);
        pesananDetail.value = pesanan;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> fetchbarang() async {
    try {
      isLoading.value = true;

      final pesanans = await _pesananService.getAllPesanan();
      pesananList.assignAll(pesanans);

    } finally {
      isLoading.value = false;
    }
  }


  var detailBarangKeluarList = <dynamic>[].obs;


  Future<void> fetchPesananDetailById() async {
    String? id = selectedid_transaksi.value;
    if(id != null) {
      try {
        isLoading.value = true;

        final barangdetails = await _barangKeluarService.getBarangKeluarDetailById(id);

        detailBarangKeluarList.assignAll(barangdetails);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void clearCart() {
    cartList.clear();
  }







  Future<void> Setuju() async {
    isLoading.value = true;

    String? id = selectedid_transaksi.value;
    if(id != null) {
      try {
        final result = await _pesananService.Setuju(id);

        if (result != null && result is Map<String, dynamic>) {
          final message = result['message'] ?? "Pesanan berhasil disetujui";
          await fetchbarang();
          await fetchpesananById();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal menyetujui",
            snackPosition: SnackPosition.BOTTOM,
          );
        }

      } finally {
        isLoading.value = false;
      }
    }
  }


  Future<void> Tolak() async {
    isLoading.value = true;

    String? id = selectedid_transaksi.value;
    if(id != null) {
      try {
        final result = await _pesananService.Tolak(id);

        if (result != null && result is Map<String, dynamic>) {
          final message = result['message'] ?? "Pesanan berhasil ditolak";
          await fetchbarang();
          await fetchpesananById();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal menolak",
            snackPosition: SnackPosition.BOTTOM,
          );
        }

      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> Selesai() async {
    isLoading.value = true;

    String? id = selectedid_transaksi.value;
    if(id != null) {
      try {
        final result = await _pesananService.Selesai(id);

        if (result != null && result is Map<String, dynamic>) {
          final message = result['message'] ?? "Pesanan berhasil diselesaikan";
          await fetchbarang();
          await fetchpesananById();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal menyelesaikan",
            snackPosition: SnackPosition.BOTTOM,
          );
        }

      } finally {
        isLoading.value = false;
      }
    }
  }

  void updateHarga(int index, String val) {
    final parsed = int.tryParse(val) ?? 0;
    detailBarangKeluarList[index]["hargajual"] = parsed;
  }

  void updateJumlah(int index, String val) {
    final parsed = int.tryParse(val) ?? 0;
    detailBarangKeluarList[index]["jumlah"] = parsed;
  }


  Future<void> Review() async {
    isLoading.value = true;
    String? id =selectedid_transaksi.value;
    if(id!=null) {
      try {
        print(detailBarangKeluarList);
        final payload = {
          "detail": detailBarangKeluarList.map((e) {
            return {
              "id_barang": e["id_barang"],
              "hargajual": double.tryParse(e["hargajual"].toString()) ?? 0,
              "jumlah": int.tryParse(e["jumlah"].toString()) ?? 0,
            };
          }).toList()
        };

        print(payload);

        final result = await _pesananService.Review(payload,id);

        if (result != null) {
          final message = result['message'] ?? "Pesanan berhasil diubah";
          Get.back();
          await fetchbarang();
          await fetchPesananDetailById();
          await fetchpesananById();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );

        } else {
          Get.snackbar("Gagal", "Gagal melakukan perubahan pesanan",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        Get.snackbar("Error", "Terjadi kesalahan: $e",
            snackPosition: SnackPosition.BOTTOM);
      } finally {
        isLoading.value = false;
      }
    }
  }

}