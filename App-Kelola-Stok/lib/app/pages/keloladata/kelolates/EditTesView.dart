import 'package:aplikasiinventorytokopulaubaru/app/controllers/TesController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTesView extends GetView<TesController>{
  const EditTesView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    controller.setFormData(Get.arguments);

    return Scaffold(
        appBar: Styles.bar("EDIT DATA"),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: controller.kolom1Controller,
                  decoration: Styles.underlineInput("kolom1"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "kolom1 wajib diisi" : null,
                ),
                TextFormField(
                  controller: controller.kolom2Controller,
                  decoration: Styles.underlineInput("kolom2"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "kolom2 wajib diisi" : null,
                ),
                TextFormField(
                  controller: controller.kolom3Controller,
                  decoration: Styles.underlineInput("kolom3"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "kolom3 wajib diisi" : null,
                ),
                SizedBox(height: 16,),
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
                  controller.editTes();
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
