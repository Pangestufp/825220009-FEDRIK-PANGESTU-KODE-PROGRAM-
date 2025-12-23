import 'package:aplikasiinventorytokopulaubaru/app/services/SubKategoriService.dart';
import 'package:get/get.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/KategoriService.dart';
import 'package:flutter/material.dart';

class SubKategoriController extends GetxController {
  final KategoriService _kategoriService = KategoriService();
  final SubKategoriService _subKategoriService = SubKategoriService();
  var isUpdating = false.obs;
  var selectedKategoriId = Rxn<int>();

  var selecteddetail = 0.obs;
  var selectedid_subkategori = Rxn<int>();

  var kategoriList = <dynamic>[].obs;
  var kategoriEditList = <dynamic>[].obs;
  var subkategoriList = <dynamic>[].obs;

  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var subkategoriDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchsubKategoris();
  }

  Future<void> fetchsubKategoris() async {
    try {
      isLoading.value = true;
      final kategoris = await _kategoriService.getAllKategori();
      kategoriList.assignAll(kategoris);
      kategoriEditList.assignAll(kategoris);

      final subkategoris = await _subKategoriService.getAllSubKategori();
      subkategoriList.assignAll(subkategoris);
      filteredList.assignAll(subkategoris);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchkategori() async {
    try {
      isLoading.value = true;
      final kategoris = await _kategoriService.getAllKategori();
      kategoriList.assignAll(kategoris);
    } finally {
      isLoading.value = false;
    }
  }

  void searchSubKategori(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(subkategoriList);
    } else {
      filteredList.assignAll(
        subkategoriList.where((u) {
          final data = "${u['namakategori']} ${u['namasubkategori']} ${u['deskripsi']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchsubKategoriById(int id) async {
    try {
      isLoading.value = true;
      final subkategori = await _subKategoriService.getSubKategoriById(id);
      subkategoriDetail.value = subkategori;

      if(subkategori!=null){
        final id_kategori = subkategori['id_kategori'];
        final namakategori = subkategori['namakategori'];

        final sudahAda = kategoriList.any((data) => data['id_kategori'] == id_kategori);

        if (!sudahAda) {
          kategoriEditList.add({
            'id_kategori': id_kategori,
            'namakategori': namakategori ?? 'Tidak diketahui',
          });
        }else{
          kategoriEditList.assignAll(kategoriList);
        }

      }

    } finally {
      isLoading.value = false;
    }
  }


  void deleteSubKategori(int id) async {
    try {
      isLoading.value = true;
      final result = await _subKategoriService.updateStatusSubKategori(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchsubKategoris();
        final message = result['message'] ?? "SubKategori berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Subkategori",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namasubkategoriController = TextEditingController();
  final deskripsiController = TextEditingController();

  Future<void> tambahsubKategori() async {
    isUpdating.value = true;
    final body = {
      "id_kategori": selectedKategoriId.value,
      "namasubkategori": namasubkategoriController.text,
      "deskripsi": deskripsiController.text,
    };

    try {
      final result = await _subKategoriService.tambahSubKategori(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchsubKategoris();
        namasubkategoriController.text = "";
        deskripsiController.text = "";
        final message = result['message'] ?? "SubKategori berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Subkategori",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;
    }
  }


  Future<void> editsubKategori() async {
    int? id=selectedid_subkategori.value;
    isUpdating.value = true;
    final body = {
      "id_kategori": selectedKategoriId.value,
      "namasubkategori": namasubkategoriController.text,
      "deskripsi": deskripsiController.text,
    };

    if(id!=null) {
      final result = await _subKategoriService.updateSubKategori(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          namasubkategoriController.text = "";
          deskripsiController.text = "";
          final message = result['message'] ?? "SubKategori berhasil diupdate";
          Get.back(result: id);
          await fetchsubKategoriById(id);
          await fetchsubKategoris();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah SubKategori",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_subkategori.value = data['id_subkategori'] ?? "";
    namasubkategoriController.text = data['namasubkategori'] ?? "";
    deskripsiController.text = data['deskripsi'] ?? "";
    selectedKategoriId.value = data['id_kategori'] ?? "";
  }

  void clean(){
    namasubkategoriController.clear();
    deskripsiController.clear();
  }

}