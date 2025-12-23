import 'package:aplikasiinventorytokopulaubaru/app/controllers/KategoriController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditKategoriView extends GetView<KategoriController> {
  const EditKategoriView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
        controller.setFormData(Get.arguments);
    });

    return Scaffold(
        appBar: Styles.bar("EDIT KATEGORI"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.namakategoriController,
                    decoration: Styles.underlineInput("Nama"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.deskripsiController,
                    decoration: Styles.underlineInput("Deskripsi"),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) =>
                    value == null || value.isEmpty ? "Deskripsi wajib diisi" : null,
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
                  controller.editKategori();
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
