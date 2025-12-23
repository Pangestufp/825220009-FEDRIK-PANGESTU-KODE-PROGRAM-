import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/HargaBarangService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HargaBarangController extends GetxController {
  final BarangService _barangService = BarangService();
  final HargaBarangService _hargaBarangService = HargaBarangService();
  var isUpdating = false.obs;
  var isLoading = false.obs;

  var selectedid_harga= Rxn<int>();
  var selectedid_barang= Rxn<int>();
  var hargaDetail = Rxn<Map<String, dynamic>>();


  var barangList = <dynamic>[].obs;
  var filteredBarangList = <dynamic>[].obs;

  var hargaBarangList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchbarang();
  }



  Future<void> fetchhargabarang(int? id) async {
    if(id!=null) {
      try {
        isLoading.value = true;
        final hargabarangs = await _hargaBarangService.getAllByIdBarang(id);
        hargaBarangList.assignAll(hargabarangs);
      } finally {
        isLoading.value = false;
      }
    }

  }

  Future<void> fetchhargabarangperid(String id) async {
    if(id!=null) {
      try {
        isLoading.value = true;
        final hargabarang = await _hargaBarangService.getAllByIdBarangIdPararel(id);
        hargaDetail.value=hargabarang;
      } finally {
        isLoading.value = false;
      }
    }

  }


  Future<void> fetchbarang() async {
    try {
      isLoading.value = true;
      final barangs = await _barangService.getAllBarang();
      barangList.assignAll(barangs);
      filteredBarangList.assignAll(barangs);

    } finally {
      isLoading.value = false;
    }
  }

  void searchBarang(String query) {
    if (query.isEmpty) {
      filteredBarangList.assignAll(barangList);
    } else {
      filteredBarangList.assignAll(
        barangList.where((u) {
          final data = "${u['namatext']}${u['namakategori']}${u['deskripsi']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  void delete() async {

    try {
      int? id = selectedid_barang.value;
      int? id2 = selectedid_harga.value;

      if (id != null&&id2!=null) {
        isLoading.value = true;
        final result = await _hargaBarangService.updateStatusHarga("${id}/${id2}");

        if (result != null && result is Map<String, dynamic>) {
          await fetchhargabarang(id);
          final message = result['message'] ?? "Harga berhasil dihapus";
          Get.back();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal menghapus Harga",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
      } catch (e) {} finally {
      isLoading.value = false;
    }

  }


  void setFormData(Map<String, dynamic> data) {
    selectedid_barang.value= data['id_barang'] ?? "";
    selectedid_harga.value = data['id_pararel'] ?? "";
    pilihan.value= data['pilihan'] ?? 0;
    hargabeliController.text =  double.parse(data['hargabeli'].toString()).toInt().toString() ?? "";
  }


  final hargabeliController = TextEditingController();
  final pilihan = 0.obs;

  void togglePilihan() {
    pilihan.value = (pilihan.value == 0) ? 1 : 0;
  }


  Future<void> tambahHargaBarang() async {
    isUpdating.value = true;
    final body = {
      "id_barang": selectedid_barang.value,
      "hargabeli": hargabeliController.text,
      "pilihan": pilihan.value
    };


    try {
      final result = await _hargaBarangService.tambahHarga(body);
      if (result != null && result is Map<String, dynamic>) {
        await fetchhargabarang(selectedid_barang.value);
        await fetchbarang();
        hargabeliController.text = "";
        final message = result['message'] ?? "Harga Barang berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Harga Barang",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isUpdating.value = false;
    }
  }

  void clean(){
    hargabeliController.clear();
  }

  Future<void> editharga() async {
    isUpdating.value = true;
    final body = {
      "hargabeli": hargabeliController.text,
      "pilihan": pilihan.value
    };
    String id="${selectedid_barang.value}/${selectedid_harga.value}";
    try {
      final result = await _hargaBarangService.updateHarga(body,id);
      if (result != null && result is Map<String, dynamic>) {
        await fetchhargabarang(selectedid_barang.value);
        await fetchhargabarangperid(id);
        await fetchbarang();
        hargabeliController.text = "";
        final message = result['message'] ?? "Harga Barang berhasil diubah";
        Get.back(result: hargaDetail);
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal mengubah Harga Barang",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isUpdating.value = false;
    }
  }

}