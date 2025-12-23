import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/FakturPembelianService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/SupplierService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarangMasukController extends GetxController {
  final BarangService _barangService = BarangService();
  final FakturPembelianService _fakturPembelianService = FakturPembelianService();
  var barangList = <dynamic>[].obs;
  var fakturList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var cartList = <dynamic>[].obs;
  var isLoading = false.obs;
  var isUpdating = false.obs;

  var cartIds = <int>{}.obs;

  var selectedSupplier = RxnInt();
  var selectedStatus = "tunai".obs;
  var dueDate = DateTime.now().obs;
  var biayaTambahan = 0.0.obs;

  Future<void> pickDueDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dueDate.value = DateTime(picked.year, picked.month, picked.day);
    }
  }

  Future<void> tambahFakturPembelian() async {
    isLoading.value = true;

    final List<Map<String, dynamic>> detail = cartList.map((item) {
      return {
        "id_barang": item['id_barang'],
        "harga": item['harga'],
        "jumlah": item['jumlah'],
      };
    }).toList();

    final body = {
      "id_supplier": selectedSupplier.value,
      "duedate": selectedStatus.value == "tunai"
          ? DateTime.now().toString().split(" ")[0] + " 00:00:00"
          : dueDate.value.toString().split(" ")[0] + " 00:00:00",
      "status": selectedStatus.value,
      "biayatambahan": biayaTambahan.value,
      "detail": detail,
    };

    try {
      final result = await _fakturPembelianService.tambahFaktur(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchFaktur();
        clearCart();
        Get.back();
        Get.snackbar("Notifikasi",
            result['message'] ?? "Faktur Pembelian berhasil ditambahkan");
      } else {
        Get.snackbar("Error", "Gagal menambahkan Faktur Pembelian");
      }
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    super.onInit();
    fetchFaktur();
  }

  final SupplierService _supplierService = SupplierService();

  var supplierList = <dynamic>[].obs;


  Future<void> fetchFaktur() async {
    try {
      isLoading.value = true;

      final suppliers = await _supplierService.getAllSupplier();;
      supplierList.assignAll(suppliers);

      final barangs = await _barangService.getAllBarangWithPrice();
      barangList.assignAll(barangs);
      filteredList.assignAll(barangs);

      final fakturs = await _fakturPembelianService.getAllfaktur();
      fakturList.assignAll(fakturs);



    } finally {
      isLoading.value = false;
    }
  }

  void searchBarang(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(barangList);
    } else {
      filteredList.assignAll(
        barangList.where((u) {
          final data = "${u['namatext']}${u['namakategori']}${u['deskripsi']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  var detailfakturList = <dynamic>[].obs;

  Future<void> fetchFakturDetailById(int id) async {
    try {
      isLoading.value = true;
      final details = await _fakturPembelianService.getFakturDetailById(id);
      detailfakturList.assignAll(details);
    } finally {
      isLoading.value = false;
    }
  }

  void addToCart(Map<String, dynamic> barang) {
    final id = barang['id_barang'];
    if (!cartIds.contains(id)) {
      cartList.add(barang);
      cartIds.add(id);
    }
  }

  void removeFromCart(int idBarang) {
    cartList.removeWhere((item) => item['id_barang'] == idBarang);
    cartIds.remove(idBarang);
  }

  void clearCart() {
    cartList.clear();
    cartIds.clear();
  }

  Future<void> tambahBarangMasuk() async {
    if (selectedSupplier.value == null) {
      Get.snackbar("Error", "Pilih supplier terlebih dahulu",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (cartList.isEmpty) {
      Get.snackbar("Error", "Keranjang masih kosong",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      final List<Map<String, dynamic>> detail = cartList.map((item) {
        return {
          "id_barang": item['id_barang'],
          "harga": item['harga'],
          "jumlah": item['jumlah'],
        };
      }).toList();

      final String formattedDueDate = selectedStatus.value.toLowerCase() == "tunai"
          ? "${DateTime.now().toIso8601String().split("T")[0]} 00:00:00"
          : "${dueDate.value.toIso8601String().split("T")[0]} 00:00:00";

      final body = {
        "id_supplier": selectedSupplier.value,
        "duedate": formattedDueDate,
        "status": selectedStatus.value.toLowerCase() == "tunai"?"lunas":"terutang",
        "biayatambahan": biayaTambahan.value,
        "detail": detail,
      };

      final result = await _fakturPembelianService.tambahFaktur(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchFaktur();
        clearCart();
        final message = result['message'] ?? "Faktur Pembelian berhasil ditambahkan";
        Get.back();
        Get.snackbar("Notifikasi", message, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Gagal menambahkan Faktur Pembelian",
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> editStatus(int id) async {
    isLoading.value = true;
    isUpdating.value = true;
    if(id!=null) {
      final result = await _fakturPembelianService.updateFaktur(id);
      try {
        if (result != null && result is Map<String, dynamic>) {
         await fetchFakturDetailById(id);
         await fetchFaktur();
          final message = result['message'] ?? "Faktur berhasil diupdate";
          Get.back();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah faktur",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isLoading.value = false;
        isUpdating.value = false;
      }
    }
  }

}