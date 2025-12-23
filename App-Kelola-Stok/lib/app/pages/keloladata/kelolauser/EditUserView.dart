import 'package:aplikasiinventorytokopulaubaru/app/controllers/AuthController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/PenggunaController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserView extends GetView<PenggunaController> {
  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
        controller.setFormData(Get.arguments);

    return Scaffold(
      appBar: Styles.bar("EDIT PENGGUNA"),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: Styles.underlineInput("Nama"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Nama wajib diisi" : null,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: Styles.underlineInput("Email"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Email wajib diisi" : null,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: Styles.underlineInput("Password"),
                  obscureText: true,
                ),
                TextFormField(
                  controller: controller.alamatController,
                  decoration: Styles.underlineInput("Alamat"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Alamat wajib diisi" : null,
                ),
                const SizedBox(height: 16),
                Obx(
                      () => DropdownButtonFormField<String>(
                    value: controller.role.value,
                    decoration: Styles.dropdownDecoration("Role"),
                    items: [
                      DropdownMenuItem(value: "partner", child: Text("Partner")),
                      DropdownMenuItem(value: "karyawan", child: Text("Karyawan")),
                      if (controller.role.value == "pemilik")
                        const DropdownMenuItem(value: "pemilik", child: Text("Pemilik")),
                    ],
                    onChanged: (val) {
                      if (val != null) controller.role.value = val;
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
        Padding(padding: EdgeInsets.all(20),
          child: Obx(
                () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.isUpdating.value
                  ? null
                  : () {
                if (_formKey.currentState?.validate() ?? false) {
                  controller.editUser();
                }
              },
              child: controller.isUpdating.value
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("Menyimpan..."),
                ],
              )
                  : Text("Edit"),
            ),
          ),
    )
    );
  }
}
