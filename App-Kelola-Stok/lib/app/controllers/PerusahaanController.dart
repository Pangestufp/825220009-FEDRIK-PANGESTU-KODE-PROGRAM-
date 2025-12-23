import 'package:aplikasiinventorytokopulaubaru/app/services/PerusahaanService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PerusahaanController extends GetxController {
  final PerusahaanService _perusahaanService = PerusahaanService();
  var isUpdating = false.obs;
  var selectedid_perusahaan = Rxn<int>();
  var selecteddetail = 0.obs;

  var perusahaanList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var perusahaanDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchPerusahaans();
  }

  Future<void> fetchPerusahaans() async {
    try {
      isLoading.value = true;
      final perusahaans = await _perusahaanService.getAllPerusahaan();
      perusahaanList.assignAll(perusahaans);
      filteredList.assignAll(perusahaans);
    } finally {
      isLoading.value = false;
    }
  }

  void searchPerusahaan(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(perusahaanList);
    } else {
      filteredList.assignAll(
        perusahaanList.where((u) {
          final data = "${u['namaperusahaan']} ${u['deskripsi']} ${u['kontak']} ${u['alamat']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchPerusahaanById(int id) async {
    try {
      isLoading.value = true;
      final perusahaan = await _perusahaanService.getPerusahaanById(id);
      perusahaanDetail.value = perusahaan;
    } finally {
      isLoading.value = false;
    }
  }


  void deletePerusahaan(int id) async {
    try {
      isLoading.value = true;
      final result = await _perusahaanService.updateStatusPerusahaan(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchPerusahaans();
        final message = result['message'] ?? "Perusahaan berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Perusahaan",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namaperusahaanController = TextEditingController();
  final deskripsiController = TextEditingController();
  final kontakController = TextEditingController();
  final alamatController = TextEditingController();

  Future<void> tambahPerusahaan() async {
    isUpdating.value = true;
    final body = {
      "namaperusahaan": namaperusahaanController.text,
      "deskripsi": deskripsiController.text,
      "kontak": kontakController.text,
      "alamat": alamatController.text,
    };

    try {
      final result = await _perusahaanService.tambahPerusahaan(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchPerusahaans();
        namaperusahaanController.text = "";
        deskripsiController.text = "";
        kontakController.text = "";
        alamatController.text = "";
        final message = result['message'] ?? "Perusahaan berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan perusahaan",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }






  Future<void> editperusahaan() async {
    int? id=selectedid_perusahaan.value;
    isUpdating.value = true;
    final body = {
      "namaperusahaan": namaperusahaanController.text,
      "deskripsi": deskripsiController.text,
      "kontak": kontakController.text,
      "alamat": alamatController.text,
    };

    if(id!=null) {
      final result = await _perusahaanService.updatePerusahaan(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchPerusahaanById(id);
          await fetchPerusahaans();
          namaperusahaanController.text = "";
          deskripsiController.text = "";
          kontakController.text = "";
          alamatController.text = "";
          final message = result['message'] ?? "Perusahaan berhasil diupdate";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Perusahaan",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_perusahaan.value = data['id_perusahaan'] ?? "";
    namaperusahaanController.text = data['namaperusahaan'] ?? "";
    deskripsiController.text = data['deskripsi'] ?? "";
    kontakController.text = data['kontak'] ?? "";
    alamatController.text = data['alamat'] ?? "";
  }

  void clean(){
    namaperusahaanController.clear();
    deskripsiController.clear();
    kontakController.clear();
    alamatController.clear();
  }


}