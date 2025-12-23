import 'package:aplikasiinventorytokopulaubaru/app/controllers/ProfilTokoController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilTokoView extends GetView<ProfilTokoController> {
  const EditProfilTokoView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
        controller.setFormData(Get.arguments);
    return Scaffold(
        appBar: Styles.bar("EDIT PROFIL TOKO"),
        body:
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.namaController,
                    decoration: Styles.underlineInput("Nama"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.alamatController,
                    decoration: Styles.underlineInput("Alamat"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Alamat wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: Styles.underlineInput("Email"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Email wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.kontakwaController,
                    decoration: Styles.underlineInput("Kontak"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Kontak Wa wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.persenmitraprofitController,
                    decoration: Styles.underlineInput("Persen Partner Profit"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Persen Partner Profit wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.persenprofitestimasiController,
                    decoration: Styles.underlineInput("Persen Profit Estimasi"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Persen Profit Estimasi wajib diisi" : null,
                  ),
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
                  controller.editProfil();
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