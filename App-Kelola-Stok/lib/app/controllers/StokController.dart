import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/StokService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StokController extends GetxController {
  final StokService _stokService = StokService();
  final BarangService _barangService = BarangService();
  var koreksiList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var selectedValue = ''.obs;

  var barangList = <dynamic>[].obs;
  var historyList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var stokInputMap = <int, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchbarang();
  }

  Future<void> fetchbarang() async {
    try {
      isLoading.value = true;
      final barangs = await _barangService.getAllBarangWithPrice();
      barangList.assignAll(barangs);

      filteredList.assignAll(barangs);
      for (var barang in barangs) {
        stokInputMap[barang['id_barang']] = barang['stok'] ?? 0;
      }

      final histories = await _stokService.getAllHistory();
      historyList.assignAll(histories);
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
          final data = "${u['namatext']}${u['namakategori']}${u['deskripsi']}"
              .toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "opname": stokInputMap.entries.map((e) {
        return {
          "id_barang": e.key,
          "stokinput": e.value,
        };
      }).toList()
    };
  }

  Future<void> koreksi() async {
    final body = toJson();

    try {
      final result = await _stokService.cekStok(body);

      if (result is List<Map<String, dynamic>>) {
        koreksiList.clear();
        setKoreksiData(result);
        Get.toNamed(Routes.KELOLA_STOKOPNAME_KOREKSI);
      } else {
        Get.snackbar(
          "Error",
          "Tidak ada perubahan",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  void setKoreksiData(List data) {
    koreksiList.value = data.map((item) {
      return {
        "id_barang": item["id_barang"],
        "namatext": item["namatext"],
        "imagepath": item["imagepath"],
        "jumlahsistem": item["jumlahsistem"],
        "jumlahinput": item["jumlahinput"],
        "selisih": item["selisih"],
        "stokinput": TextEditingController(text: item["jumlahinput"].toString())
      };
    }).toList();
  }

  Map<String, dynamic> toKoreksiJson(String alasan) {
    return {
      "alasan": alasan,
      "koreksi": koreksiList.map((item) {
        return {
          "id_barang": item["id_barang"],
          "stokinput": int.tryParse(item["stokinput"].text) ?? -1,
        };
      }).toList()
    };
  }

  Future<void> simpanKoreksi(String text) async {
    if (text == "") {
      Get.snackbar(
        "Error",
        "Alasan tidak boleh kosong",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      final body = toKoreksiJson(text);

      try {
        final result = await _stokService.Koreksi(body);
        if (result != null && result is Map<String, dynamic>) {
          final message = result["message"] ?? "Koreksi berhasil disimpan";
          await fetchbarang();
          Get.back();
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah Stok",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isLoading.value = false;
      }
    }
  }

  var logDetail = Rxn<Map<String, dynamic>>();

  Future<void> fetchDetailLog(int id) async {
    try {
      isLoading.value = true;
      final log = await _stokService.gethistoryById(id);
      print(log);
      logDetail.value = log;
    } finally {
      isLoading.value = false;
    }
  }
}
