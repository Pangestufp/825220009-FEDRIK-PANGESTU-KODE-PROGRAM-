import 'package:aplikasiinventorytokopulaubaru/app/services/BarangKeluarService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:get/get.dart';

class BarangKeluarController extends GetxController {

  final BarangService _barangService = BarangService();
  final BarangKeluarService _barangKeluarService = BarangKeluarService();
  var barangList = <dynamic>[].obs;
  var barangKeluarList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var cartList = <dynamic>[].obs;
  var isLoading = false.obs;

  var cartIds = <int>{}.obs;

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

      final barangkeluars = await _barangKeluarService.getAllBarangKeluar();
      barangKeluarList.assignAll(barangkeluars);

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

  var detailBarangKeluarList = <dynamic>[].obs;

  Future<void> fetchBarangKeluarDetailById(String id) async {
    try {
      isLoading.value = true;
      final barangdetails = await _barangKeluarService.getBarangKeluarDetailById(id);
      detailBarangKeluarList.assignAll(barangdetails);
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

  Future<void> tambahBarangKeluar() async {
    isLoading.value = true;

    final List<Map<String, dynamic>> detail = cartList.map((item) {
      return {
        "id_barang": item['id_barang'],
        "hargajual": item['hargajual'],
        "jumlah": item['jumlah'],
      };
    }).toList();

    final body = {
      "detail": detail,
    };

    try {
      final result = await _barangKeluarService.tambahBarangKeluar(body);

      if (result != null && result is Map<String, dynamic>) {
        await fetchbarang();
        clearCart();
        final message = result['message'] ?? "Barang keluar berhasil ditambahkan";
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menambahkan Barang Keluar",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }


}