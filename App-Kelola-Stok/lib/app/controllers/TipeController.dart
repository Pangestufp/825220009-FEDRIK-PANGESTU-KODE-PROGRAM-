import 'package:aplikasiinventorytokopulaubaru/app/services/TipeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipeController extends GetxController {
  final TipeService _tipeService = TipeService();
  var isUpdating = false.obs;

  var selecteddetail = 0.obs;
  var selectedid_tipe = Rxn<int>();
  var tipeList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var tipeDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchtipes();
  }

  Future<void> fetchtipes() async {
    try {
      isLoading.value = true;
      final tipes = await _tipeService.getAlltipe();
      tipeList.assignAll(tipes);
      filteredList.assignAll(tipes);
    } finally {
      isLoading.value = false;
    }
  }

  void searchTipe(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(tipeList);
    } else {
      filteredList.assignAll(
        tipeList.where((u) {
          final data = "${u['namatipe']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchTipeById(int id) async {
    try {
      isLoading.value = true;
      final tipe = await _tipeService.getTipeById(id);
      tipeDetail.value = tipe;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteTipe(int id) async {
    try {
      isLoading.value = true;
      final result = await _tipeService.updateStatusTipe(id);

      if (result != null && result is Map<String, dynamic>) {
        final message = result['message'] ?? "Tipe berhasil dihapus";
        await fetchtipes();
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Tipe",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namatipeController = TextEditingController();

  Future<void> tambahTipe() async {
    isUpdating.value = true;
    final body = {
      "namatipe": namatipeController.text,
    };

    try {
      final result = await _tipeService.tambahTipe(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchtipes();
        namatipeController.text = "";
        final message = result['message'] ?? "Tipe berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Tipe",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }

  Future<void> edittipe() async {
    int? id = selectedid_tipe.value;
    isUpdating.value = true;
    final body = {
      "namatipe": namatipeController.text,
    };

    if(id != null) {
      final result = await _tipeService.updateTipe(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchTipeById(id);
          await fetchtipes();
          namatipeController.text = "";
          final message = result['message'] ?? "Tipe berhasil diupdate";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Tipe",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_tipe.value = data['id_tipe'] ?? "";
    namatipeController.text = data['namatipe'] ?? "";
  }

  void clean(){
    namatipeController.clear();
  }
}