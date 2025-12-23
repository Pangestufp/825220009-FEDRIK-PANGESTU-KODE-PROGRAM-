import 'package:aplikasiinventorytokopulaubaru/app/services/ProfilTokoService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilTokoController extends GetxController {
  final ProfilTokoService _profilTokoService = ProfilTokoService();
  var isUpdating = false.obs;

  var isLoading = false.obs;

  var profilDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchProfil();
  }

  Future<void> fetchProfil() async {
    try {
      isLoading.value = true;
      final profil = await _profilTokoService.getProfilToko();
      profilDetail.value = profil;

    } finally {
      isLoading.value = false;
    }
  }

  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final emailController = TextEditingController();
  final kontakwaController = TextEditingController();
  final persenmitraprofitController = TextEditingController();
  final persenprofitestimasiController = TextEditingController();

  Future<void> editProfil() async {
    isUpdating.value = true;
    final body = {
      "nama": namaController.text,
      "alamat": alamatController.text,
      "email": emailController.text,
      "kontakwa": kontakwaController.text,
      "persenmitraprofit": persenmitraprofitController.text,
      "persenprofitestimasi": persenprofitestimasiController.text,
    };

    try {
      final result = await _profilTokoService.updateProfilToko(body);

      print(body);
      if (result != null && result is Map<String, dynamic>) {
        await fetchProfil();
        namaController.text = "";
        alamatController.text = "";
        emailController.text = "";
        kontakwaController.text = "";
        persenmitraprofitController.text = "";
        persenprofitestimasiController.text = "";
        final message = result['message'] ?? "Profil berhasil diubah";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal mengubah Profil",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }

  void setFormData(Map<String, dynamic> data) {
    namaController.text = data['nama'] ?? "";
    alamatController.text = data['alamat'] ?? "";
    emailController.text = data['email'] ?? "";
    kontakwaController.text = data['kontakwa'] ?? "";
    persenmitraprofitController.text = data['persenmitraprofit'] ?? "";
    persenprofitestimasiController.text = data['persenprofitestimasi'] ?? "";
  }

}