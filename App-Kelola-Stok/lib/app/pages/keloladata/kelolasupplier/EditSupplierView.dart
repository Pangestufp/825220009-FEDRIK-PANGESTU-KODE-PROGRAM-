import 'package:aplikasiinventorytokopulaubaru/app/controllers/SupplierController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSupplierView extends GetView<SupplierController> {
  const EditSupplierView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

        controller.setFormData(Get.arguments);

    return Scaffold(
        appBar: Styles.bar("EDIT SUPPLIER"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.namasupplierController,
                    decoration: Styles.underlineInput("Nama"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.kontakController,
                    decoration: Styles.underlineInput("Kontak"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Kontak wajib diisi" : null,
                  ),
                  SizedBox(height: 16,),
                  Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedPerusahaanId.value,
                      decoration: Styles.dropdownDecoration("Perusahaan"),
                      items: controller.perusahaanEditList.map<DropdownMenuItem<int>>((kategori) {
                        return DropdownMenuItem<int>(
                          value: kategori['id_perusahaan'],
                          child: Text(kategori['namaperusahaan']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedPerusahaanId.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Perusahaan wajib dipilih" : null,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  controller.editSupplier();
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