import 'package:aplikasiinventorytokopulaubaru/app/services/PerusahaanService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/SupplierService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupplierController extends GetxController {
  final PerusahaanService _perusahaanService = PerusahaanService();
  final SupplierService _supplierService = SupplierService();
  var selectedPerusahaanId = Rxn<int>();
  var isUpdating = false.obs;
  var selecteddetail = 0.obs;

  var selectedid_supplier = Rxn<int>();
  var perusahaanList = <dynamic>[].obs;
  var perusahaanEditList = <dynamic>[].obs;
  var supplierList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var supplierDetail = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  Future<void> fetchSuppliers() async {
    try {
      isLoading.value = true;
      final perusahaans = await _perusahaanService.getAllPerusahaan();
      perusahaanList.assignAll(perusahaans);
      perusahaanEditList.assignAll(perusahaans);

      final suppliers = await _supplierService.getAllSupplier();;
      supplierList.assignAll(suppliers);
      filteredList.assignAll(suppliers);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchperusahaan() async {
    try {
      isLoading.value = true;
      final perusahaans = await _perusahaanService.getAllPerusahaan();
      perusahaanList.assignAll(perusahaans);
    } finally {
      isLoading.value = false;
    }
  }

  void searchSupplier(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(supplierList);
    } else {
      filteredList.assignAll(
        supplierList.where((u) {
          final data = "${u['namaperusahaan']} ${u['namasupplier']} ${u['kontak']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchSupplierById(int id) async {
    try {
      isLoading.value = true;
      final supplier = await _supplierService.getSupplierById(id);
      supplierDetail.value = supplier;
      if(supplier!=null){
        final id_perusahaan = supplier['id_perusahaan'];
        final namaperusahaan = supplier['namaperusahaan'];

        final sudahAda = perusahaanList.any((data) => data['id_perusahaan'] == id_perusahaan);

        if (!sudahAda) {
          perusahaanEditList.add({
            'id_perusahaan': id_perusahaan,
            'namaperusahaan': namaperusahaan ?? 'Tidak diketahui',
          });
        }else{
          perusahaanEditList.assignAll(perusahaanList);
        }

      }
    } finally {
      isLoading.value = false;
    }
  }


  void deleteSupplier(int id) async {
    try {
      isLoading.value = true;
      final result = await _supplierService.updateStatusSupplier(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchSuppliers();
        final message = result['message'] ?? "Supplier berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Supplier",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namasupplierController = TextEditingController();
  final kontakController = TextEditingController();

  Future<void> tambahsupplier() async {
    isUpdating.value = true;
    final body = {
      "id_perusahaan": selectedPerusahaanId.value,
      "namasupplier": namasupplierController.text,
      "kontak": kontakController.text,
    };

    try {
      final result = await _supplierService.tambahSupplier(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchSuppliers();
        namasupplierController.text = "";
        kontakController.text = "";
        final message = result['message'] ?? "Supplier berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Supplier",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }






  Future<void> editSupplier() async {
    isUpdating.value = true;
    int? id = selectedid_supplier.value;
    final body = {
      "id_perusahaan": selectedPerusahaanId.value,
      "namasupplier": namasupplierController.text,
      "kontak": kontakController.text,
    };

    if(id!=null) {
      final result = await _supplierService.updateSupplier(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          namasupplierController.text = "";
          kontakController.text = "";
          final message = result['message'] ?? "Supplier berhasil diupdate";
          Get.back(result: id);
          await fetchSuppliers();
          await fetchSupplierById(id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Supplier",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_supplier.value = data['id_supplier'] ?? "";
    namasupplierController.text = data['namasupplier'] ?? "";
    kontakController.text = data['kontak'] ?? "";
    selectedPerusahaanId.value =  data['id_perusahaan'] ?? "";
  }


  void clean(){
    namasupplierController.clear();
    kontakController.clear();
  }

}