import 'package:aplikasiinventorytokopulaubaru/app/services/LaporanService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LaporanController extends GetxController {
  final LaporanService _laporanService = LaporanService();
  var laporanList = <dynamic>[].obs;
  var isLoading = false.obs;
  var lastQueryParam = "".obs;
  var logData = <String, dynamic>{}.obs;

  Future<void> cekLaporanCustom(String tahun, String bulan1, String bulan2) async {
    isLoading.value = true;
    try {
      final result = await _laporanService.checkLaporan(tahun, bulan1, bulan2);
      if (result.isNotEmpty) {
        laporanList.clear();
        lastQueryParam.value = "?tahun=$tahun&bulan_awal=$bulan1&bulan_akhir=$bulan2";
        laporanList.assignAll(result);
      } else {
        lastQueryParam.value = "";
        laporanList.clear();
        Get.snackbar("Info", "Data tidak ditemukan untuk periode tersebut",
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> openLaporanPDF() async {
    if (lastQueryParam.value.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Silakan lakukan pembuatan laporan terlebih dahulu",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final url = Uri.parse(EndPoints.laporanCreate + lastQueryParam.value);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Gagal membuka laporan PDF');
    }
  }

  Future<void> getLogData() async {
    isLoading.value = true;
    try {
      final result = await _laporanService.getLog();
      if (result != null) {
        logData.assignAll(result);
      } else {
        logData.clear();
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLogData();
  }

  final dataController = TextEditingController();

  Future<void> inputOmsetData() async {
    isLoading.value = true;
    try {
      final textValue = dataController.text.trim();

      // Cek apakah input kosong
      if (textValue.isEmpty) {
        Get.snackbar(
          "Peringatan",
          "Nilai omset tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Coba parse ke double
      final nilai = double.tryParse(textValue);

      if (nilai == null) {
        Get.snackbar(
          "Peringatan",
          "Masukkan angka yang valid",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Jika valid, kirim ke service
      final result = await _laporanService.inputOmset({"omsetinput": nilai});
      if (result != null) {
        final message = result['message'] ?? "Omset harian berhasil ditambahkan";
        dataController.clear();
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
        await getLogData();
      } else {
        Get.snackbar(
          "Gagal",
          "Gagal menyimpan omset",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.BOTTOM,
      );

  } finally {
      isLoading.value = false;
    }
  }



}
