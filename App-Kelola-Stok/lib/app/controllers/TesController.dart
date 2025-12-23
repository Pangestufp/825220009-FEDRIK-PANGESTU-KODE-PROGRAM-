import 'package:aplikasiinventorytokopulaubaru/app/services/TesService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TesController extends GetxController {
  final TesService _tesService = TesService();
  String para = "";

  var selectedPerusahaanId = Rxn<int>();

  var isUpdating = false.obs;
  var selecteddetail = 0.obs;

  var selectedid_tes = Rxn<int>();
  var tesList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var tesDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchtess();
  }

  Future<void> fetchtess() async {
    try {
      isLoading.value = true;

      final tess = await _tesService.getAllTes();
      tesList.assignAll(tess);
      filteredList.assignAll(tess);
    } finally {
      isLoading.value = false;
    }
  }


  void searchTes(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(tesList);
      para="";
    } else {
      para=query.toLowerCase();
      filteredList.assignAll(
        tesList.where((u) {
          final data = "${u['kolom1']} ${u['kolom2']} ${u['kolom3']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchTesById(int id) async {
    try {
      isLoading.value = true;
      final tes = await _tesService.getTesById(id);
      tesDetail.value = tes;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteTes(int id) async {
    try {
      isLoading.value = true;
      final result = await _tesService.updateStatusTes(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchtess();
        final message = result['message'] ?? "Data berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus data",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final kolom1Controller = TextEditingController();
  final kolom2Controller = TextEditingController();
  final kolom3Controller = TextEditingController();


  Future<void> tambahtes() async {
    isUpdating.value = true;
    final body = {
      "kolom1": kolom1Controller.text,
      "kolom2": kolom2Controller.text,
      "kolom3": kolom3Controller.text,
    };

    try {
      final result = await _tesService.tambahTes(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchtess();
        kolom1Controller.clear();
        kolom2Controller.clear();
        kolom3Controller.clear();
        final message = result['message'] ?? "data berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan data",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }






  Future<void> editTes() async {
    isUpdating.value = true;
    int? id = selectedid_tes.value;
    final body = {
      "kolom1": kolom1Controller.text,
      "kolom2": kolom2Controller.text,
      "kolom3": kolom3Controller.text,
    };

    if(id!=null) {
      final result = await _tesService.updateTes(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          kolom1Controller.clear();
          kolom2Controller.clear();
          kolom3Controller.clear();
          final message = result['message'] ?? "Data berhasil diupdate";
          Get.back(result: id);
          await fetchtess();
          await fetchTesById(id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah data",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  Future<void> openLaporanPDF() async {
    final url = Uri.parse(EndPoints.laporanPrintData+"?query="+para);
    print(url);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Gagal membuka laporan PDF');
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_tes.value = data['id_tes'] ?? "";
    kolom1Controller.text = data['kolom1'] ?? "";
    kolom2Controller.text = data['kolom2'] ?? "";
    kolom3Controller.text = data['kolom3'] ?? "";
  }


  void clean(){
    kolom1Controller.clear();
    kolom2Controller.clear();
    kolom3Controller.clear();
  }
}