import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/FakturPembelianService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/ReturService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/SupplierService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/TipeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturController extends GetxController {
  final BarangService _barangService = BarangService();
  final FakturPembelianService _fakturPembelianService = FakturPembelianService();
  final SupplierService _supplierService = SupplierService();
  final TipeService _tipeService = TipeService();
  final ReturService _returService = ReturService();
  var fakturList = <dynamic>[].obs;
  var supplierList = <dynamic>[].obs;
  var tipeList = <dynamic>[].obs;

  var returQty = <int, int>{}.obs; // key = id_barang, value = qty


  var returList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var detailfakturList = <dynamic>[].obs;

  Future<void> fetchAvaiById(int id) async {
    try {
      isLoading.value = true;
      final details = await _returService.getAvaiById(id);

      detailfakturList.assignAll(details);

      returQty.clear();
      for (var item in details) {
        returQty[item['id_barang']] = 0; // awalnya 0
      }

    } finally {
      isLoading.value = false;
    }
  }

  void addQty(int idBarang, int max) {
    final current = returQty[idBarang] ?? 0;
    if (current < max) {
      returQty[idBarang] = current + 1;
    }
  }

  void reduceQty(int idBarang) {
    final current = returQty[idBarang] ?? 0;
    if (current > 0) {
      returQty[idBarang] = current - 1;
    }
  }


  var detailReturList = <dynamic>[].obs;

  Future<void> fetchDetailReturById(int id) async {
    try {
      isLoading.value = true;
      final details = await _returService.getReturDetailById(id);
      detailReturList.assignAll(details);
    } finally {
      isLoading.value = false;
    }
  }




  @override
  void onInit() {
    super.onInit();
    fetchRetur();
  }

  Future<void> fetchRetur() async {
    try {
      isLoading.value = true;
      final suppliers = await _supplierService.getAllSupplier();
      supplierList.assignAll(suppliers);

      final barangs = await _fakturPembelianService.getAllfaktur();
      fakturList.assignAll(barangs);
      filteredList.assignAll(barangs);

      final tipes = await _tipeService.getAlltipe();
      tipeList.assignAll(tipes);

      final returs = await _returService.getAllRetur();
      returList.assignAll(returs);

    } finally {
      isLoading.value = false;
    }
  }

  void searchBarang(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(fakturList);
    } else {
      filteredList.assignAll(
        fakturList.where((u) {
          final data = "${u['namasupplier']}${u['namaperusahaan']}${u['createat']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }


  var selectedid_supplier = Rxn<int>();
  var selectedid_barang = Rxn<int>();
  var selectedid_tipe = Rxn<int>();

  final hargaController = TextEditingController();
  final jumlahController = TextEditingController();

  Future<void> tambahRetur(int idFaktur) async {
    isLoading.value = true;
    final detail = returQty.entries
        .where((e) => e.value > 0) // hanya ambil yang qty > 0
        .map((e) => {
      "id_barang": e.key,
      "jumlah": e.value,
    })
        .toList();

    final body = {
      "id_faktur": idFaktur,
      "id_tipe": selectedid_tipe.value,
      "detail": detail
    };

    print(body);

    try {
      final result = await _returService.tambahRetur(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchRetur();
        hargaController.text = "";
        jumlahController.text = "";
        final message = result['message'] ?? "Retur berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Retur",
          snackPosition: SnackPosition.BOTTOM,
        );
      }


    } finally {
      returQty.clear();
      isLoading.value = false;
    }
  }


  // void setFormData(Map<String, dynamic> data) {
  //   selectedid_barang.value = data['id_barang'] ?? "";
  // }


}