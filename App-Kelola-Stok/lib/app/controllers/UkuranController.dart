import 'package:aplikasiinventorytokopulaubaru/app/services/SatuanService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/UkuranService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UkuranController extends GetxController {
  final SatuanService _satuanService = SatuanService();
  final UkuranService _ukuranService = UkuranService();
  var isUpdating = false.obs;
  var selectedsatuanId = Rxn<int>();

  var selecteddetail = 0.obs;
  var selectedid_ukuran = Rxn<int>();
  var satuanList = <dynamic>[].obs;
  var satuanEditList = <dynamic>[].obs;
  var ukuranList = <dynamic>[].obs;

  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var ukuranDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchukurans();
  }

  Future<void> fetchukurans() async {
    try {
      isLoading.value = true;
      final satuans = await _satuanService.getAllSatuan();
      satuanList.assignAll(satuans);
      satuanEditList.assignAll(satuans);

      final ukurans = await _ukuranService.getAllUkuran();
      ukuranList.assignAll(ukurans);
      filteredList.assignAll(ukurans);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchsatuan() async {
    try {
      isLoading.value = true;
      final satuans = await _satuanService.getAllSatuan();
      satuanList.assignAll(satuans);
    } finally {
      isLoading.value = false;
    }
  }


  void searchukuran(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(ukuranList);
    } else {
      filteredList.assignAll(
        ukuranList.where((u) {
          final data = "${u['namasatuan']}${u['ukuran']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchukuranById(int id) async {
    try {
      isLoading.value = true;
      final ukuran = await _ukuranService.getUkuranById(id);
      ukuranDetail.value = ukuran;

      if(ukuran!=null){
        final idSatuan = ukuran['id_satuan'];
        final namaSatuan = ukuran['namasatuan'];

        final sudahAda = satuanList.any((satuan) => satuan['id_satuan'] == idSatuan);

        if (!sudahAda) {
          satuanEditList.add({
            'id_satuan': idSatuan,
            'namasatuan': namaSatuan ?? 'Tidak diketahui',
          });
        }else{
          satuanEditList.assignAll(satuanList);
        }

      }
    } finally {
      isLoading.value = false;
    }
  }


  void deleteUkuran(int id) async {
    try {
      isLoading.value = true;
      final result = await _ukuranService.updateStatusUkuran(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchukurans();
        final message = result['message'] ?? "Ukuran berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Ukuran",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final ukuranController = TextEditingController();

  Future<void> tambahUkuran() async {
    isUpdating.value = true;
    final body = {
      "id_satuan": selectedsatuanId.value,
      "ukuran": ukuranController.text,
    };

    try {
      final result = await _ukuranService.tambahUkuran(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchukurans();
        ukuranController.text = "";
        final message = result['message'] ?? "Ukuran berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Ukuran",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }

  Future<void> editukuran() async {
    int? id = selectedid_ukuran.value;
    isUpdating.value = true;
    final body = {
      "id_satuan": selectedsatuanId.value,
      "ukuran": ukuranController.text,
    };

    if(id!=null) {
      final result = await _ukuranService.updateUkuran(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          ukuranController.text = "";
          final message = result['message'] ?? "Ukuran berhasil diupdate";
          Get.back();
          await fetchukuranById(id);
          await fetchukurans();

          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Ukuran",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_ukuran.value = data['id_ukuran'] ?? "";
    ukuranController.text = "${data['ukuran']}" ?? "0";
    selectedsatuanId.value = data['id_satuan'] ?? "";
  }

  void clean(){
    ukuranController.clear();
  }
}