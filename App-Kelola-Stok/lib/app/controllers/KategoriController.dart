import 'package:aplikasiinventorytokopulaubaru/app/services/KategoriService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KategoriController extends GetxController {
  final KategoriService _kategoriService = KategoriService();
  var isUpdating = false.obs;

  var selecteddetail = 0.obs;
  var selectedid_kategori = Rxn<int>();
  var kategoriList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var kategoriDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchKategoris();
  }

  Future<void> fetchKategoris() async {
    try {
      isLoading.value = true;
      final kategoris = await _kategoriService.getAllKategori();
      kategoriList.assignAll(kategoris);
      filteredList.assignAll(kategoris);
    } finally {
      isLoading.value = false;
    }
  }

  void searchKategori(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(kategoriList);
    } else {
      filteredList.assignAll(
        kategoriList.where((u) {
          final data = "${u['namakategori']} ${u['deskripsi']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchKategoriById(int id) async {
    try {
      isLoading.value = true;
      final kategori = await _kategoriService.getKategoriById(id);
      kategoriDetail.value = kategori;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteKategori(int id) async {
    try {
      isLoading.value = true;
      final result = await _kategoriService.updateStatusKategori(id);

      if (result != null && result is Map<String, dynamic>) {
        fetchKategoris();
        final message = result['message'] ?? "Kategori berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus kategori",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namakategoriController = TextEditingController();
  final deskripsiController = TextEditingController();

  Future<void> tambahKategori() async {
    isUpdating.value = true;
    final body = {
      "namakategori": namakategoriController.text,
      "deskripsi": deskripsiController.text,
    };

    try {
      final result = await _kategoriService.tambahKategori(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchKategoris();
        namakategoriController.text = "";
        deskripsiController.text = "";
        final message = result['message'] ?? "Kategori berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan kategori",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;
    }
  }



  Future<void> editKategori() async {
    int? id=selectedid_kategori.value;
    isUpdating.value = true;
    final body = {
      "namakategori": namakategoriController.text,
      "deskripsi": deskripsiController.text,
    };

    if(id!=null) {
      final result = await _kategoriService.updateKategori(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchKategoriById(id);
          await fetchKategoris();
          namakategoriController.text = "";
          deskripsiController.text = "";
          final message = result['message'] ?? "Kategori berhasil diupdate";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Kategori",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_kategori.value= data['id_kategori'] ?? "";
    print(selectedid_kategori.value);
    namakategoriController.text = data['namakategori'] ?? "";
    deskripsiController.text = data['deskripsi'] ?? "";
  }


  void clean(){
    namakategoriController.clear();
    deskripsiController.clear();
  }

}