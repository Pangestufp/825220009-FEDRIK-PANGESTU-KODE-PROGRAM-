import 'package:aplikasiinventorytokopulaubaru/app/services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenggunaController extends GetxController {
  final UserService _userService = UserService();
  var isUpdating = false.obs;

  var selecteddetail = 0.obs;
  var selectedid_user = Rxn<int>();
  var userList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var userDetail = Rxn<Map<String, dynamic>>();



  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final users = await _userService.getAllUsers();
      userList.assignAll(users);
      filteredList.assignAll(users);
    } finally {
      isLoading.value = false;
    }
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(userList);
    } else {
      filteredList.assignAll(
        userList.where((u) {
          final data = "${u['name']} ${u['email']} ${u['alamat']} ${u['role']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchUserById(int id) async {
    try {
      isLoading.value = true;
      final user = await _userService.getUserById(id);
      userDetail.value = user;
    } finally {
      isLoading.value = false;
    }
  }


  void deleteUser(int id) async {
    try {
      isLoading.value = true;
      final result = await _userService.updateStatusUser(id);

      if (result != null && result is Map<String, dynamic>) {
        final message = result['message'] ?? "User berhasil dihapus";
        await fetchUsers();
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus user",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final alamatController = TextEditingController();
  var role = "karyawan".obs;


  Future<void> tambahUser() async {
    isUpdating.value = true;
    final body = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "alamat": alamatController.text,
      "role": role.value,
    };

    try {
    final result = await _userService.tambahUser(body);

    if (result != null && result is Map<String, dynamic>) {
      await fetchUsers();
      final message = result['message'] ?? "User berhasil ditambahkan";
      nameController.text = "";
      emailController.text = "";
      passwordController.text = "";
      alamatController.text = "";
      Get.back();
      Get.snackbar(
        "Notifikasi",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );

    } else {
      Get.snackbar(
        "Error",
        "Gagal menambahkan user",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    } finally {
      isUpdating.value = false;
    }
  }






  Future<void> editUser() async {
    int? id = selectedid_user.value;
    isUpdating.value = true;
    final body = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "alamat": alamatController.text,
      "role": role.value,
    };

    if(id!=null) {
      final result = await _userService.updateUser(body, id);
      try {
        if (result != null && result is Map<String, dynamic>) {
          await fetchUserById(id);
          await fetchUsers();
          final message = result['message'] ?? "User berhasil diupdate";
          nameController.text = "";
          emailController.text = "";
          passwordController.text = "";
          alamatController.text = "";
          Get.back(result: id);
          Get.snackbar(
            "Notifikasi",
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            "Error",
            "Gagal mengubah user",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void setFormData(Map<String, dynamic> data) {
    selectedid_user.value = data['id'] ?? "";
    nameController.text = data['name'] ?? "";
    emailController.text = data['email'] ?? "";
    passwordController.text = "";
    alamatController.text = data['alamat'] ?? "";
    role.value = data['role'] ?? "karyawan";
  }

  void clean(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    alamatController.clear();
  }


}