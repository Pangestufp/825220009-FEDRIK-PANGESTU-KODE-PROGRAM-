import 'package:aplikasiinventorytokopulaubaru/app/controllers/AuthController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/AuthService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/TokenService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/UserService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuUtamaController extends GetxController {
  final BarangService _barangService = BarangService();
  var barangList = <dynamic>[].obs;
  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  final searchQuery = ''.obs;

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    searchFocus.unfocus();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocus.dispose();
    super.onClose();
  }

  Future<void> fetchbarang() async {
    try {

      isLoadingBarang.value = true;
      final barangs = await _barangService.getAllRekomendasiBarang();
      barangList.assignAll(barangs);
    } finally {
      isLoadingBarang.value = false;
      if(isLoadingUser.value == true){
        isLoadingUser.value = false;
      }
    }
  }

  final UserService _userService = UserService();
  final AuthService _authService = AuthService();
  final TokenService _tokenService = TokenService();

  var user = Rxn<Map<String, dynamic>>();
  var isLoadingUser = false.obs;
  var isLoadingBarang = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchbarang();
  }

  Future<void> fetchUserData() async {
    isLoadingUser.value = true;
    try {
      final userData = await _userService.getMyData();
      if (userData != null) {
        user.value = userData;

        final role = user.value?['role'] ?? '';
        print("Role user : "+role);
        if (role.toLowerCase() == 'partner') {

            await _authService.logout();
            Get.offAllNamed(Routes.MENU_LOGIN);
            Get.snackbar("Error", "Partner tidak bisa masuk ke aplikasi ini",snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal mengambil data pengguna: $e");
    } finally {
      if(isLoadingBarang.value == false){
        isLoadingUser.value = false;
      }
    }
  }

  Future<void> logoutAndRedirect() async {
    final success = await _authService.logout();
    if (success) {
      Get.offAllNamed(Routes.MENU_LOGIN);
    } else {
      Get.snackbar("Error", "Logout gagal");
    }
  }
}
