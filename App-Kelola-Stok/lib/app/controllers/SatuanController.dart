import 'package:aplikasiinventorytokopulaubaru/app/services/SatuanService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SatuanController extends GetxController {
  final SatuanService _satuanService = SatuanService();
  var isUpdating = false.obs;

  var selecteddetail = 0.obs;
  var selectedid_satuan = Rxn<int>();
  var satuanList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var satuanDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchsatuans();
  }

  Future<void> fetchsatuans() async {
    try {
      isLoading.value = true;
      final satuans = await _satuanService.getAllSatuan();
      satuanList.assignAll(satuans);
      filteredList.assignAll(satuans);
    } finally {
      isLoading.value = false;
    }
  }

  void searchSatuan(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(satuanList);
    } else {
      filteredList.assignAll(
        satuanList.where((u) {
          final data = "${u['namasatuan']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchSatuanById(int id) async {
    try {
      isLoading.value = true;
      final satuan = await _satuanService.getSatuanById(id);
      satuanDetail.value = satuan;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteSatuan(int id) async {
    try {
      isLoading.value = true;
      final result = await _satuanService.updateStatusSatuan(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchsatuans();
        final message = result['message'] ?? "Satuan berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Satuan",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namasatuanController = TextEditingController();

  Future<void> tambahSatuan() async {
    isUpdating.value = true;
    final body = {
      "namasatuan": namasatuanController.text,
    };

    try {
      final result = await _satuanService.tambahSatuan(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchsatuans();
        namasatuanController.text = "";
        final message = result['message'] ?? "Satuan berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Satuan",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }

  Future<void> editsatuan() async {
    isUpdating.value = true;
    int? id = selectedid_satuan.value;
    final body = {
      "namasatuan": namasatuanController.text,
    };

    if(id!=null) {
      final result = await _satuanService.updateSatuan(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchSatuanById(id);
          await fetchsatuans();
          namasatuanController.text = "";
          final message = result['message'] ?? "Satuan berhasil diupdate";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Satuan",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_satuan.value = data['id_satuan'] ?? "";
    namasatuanController.text = data['namasatuan'] ?? "";
  }

  void clean(){
    namasatuanController.clear();
  }
}