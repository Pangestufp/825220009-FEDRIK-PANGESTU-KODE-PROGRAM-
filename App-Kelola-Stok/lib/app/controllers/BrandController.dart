import 'package:aplikasiinventorytokopulaubaru/app/services/BrandService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  final BrandService _brandService = BrandService();
  var isUpdating = false.obs;
  var selectedid_brand= Rxn<int>();
  var brandList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var brandDetail = Rxn<Map<String, dynamic>>();
  var selecteddetail = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchbrands();
  }

  Future<void> fetchbrands() async {
    try {
      isLoading.value = true;
      final brands = await _brandService.getAllbrand();
      brandList.assignAll(brands);
      filteredList.assignAll(brands);
    } finally {
      isLoading.value = false;
    }
  }

  void searchBrand(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(brandList);
    } else {
      filteredList.assignAll(
        brandList.where((u) {
          final data = "${u['namabrand']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchBrandById(int id) async {
    try {
      isLoading.value = true;
      final brand = await _brandService.getbrandById(id);
      brandDetail.value = brand;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteBrand(int id) async {
    try {
      isLoading.value = true;
      final result = await _brandService.updateStatusBrand(id);

      if (result != null && result is Map<String, dynamic>) {
        await fetchbrands();
        final message = result['message'] ?? "Brand berhasil dihapus";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Brand",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final namabrandController = TextEditingController();

  Future<void> tambahBrand() async {
    isUpdating.value = true;
    final body = {
      "namabrand": namabrandController.text,
    };

    try {
      final result = await _brandService.tambahBrand(body);

      if (result != null && result is Map<String, dynamic>) {

        await fetchbrands();
        namabrandController.text = "";
        final message = result['message'] ?? "Brand berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Brand",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

    } finally {
      isUpdating.value = false;

    }
  }






  Future<void> editbrand() async {
    int? id=selectedid_brand.value;
    isUpdating.value = true;
    final body = {
      "namabrand": namabrandController.text,
    };

    if(id!=null) {
      final result = await _brandService.updateBrand(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchBrandById(id);
          await fetchbrands();
          namabrandController.text = "";
          final message = result['message'] ?? "Brand berhasil diupdate";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Brand",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void clean(){
    namabrandController.clear();
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_brand.value = data['id_brand'] ?? "";
    print(selectedid_brand.value);
    namabrandController.text = data['namabrand'] ?? "";
  }
}