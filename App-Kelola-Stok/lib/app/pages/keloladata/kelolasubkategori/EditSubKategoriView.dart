import 'package:aplikasiinventorytokopulaubaru/app/controllers/SubKategoriController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSubKategoriView extends GetView<SubKategoriController> {
  const EditSubKategoriView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
        controller.setFormData(Get.arguments);

    return Scaffold(
        appBar: Styles.bar("EDIT SUBKATEGORI"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.namasubkategoriController,
                    decoration: Styles.underlineInput("Nama"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
                  ),
                  TextFormField(
                    controller: controller.deskripsiController,
                    decoration: Styles.underlineInput("Deskripsi"),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Deskripsi wajib diisi" : null,
                  ),
                  SizedBox(height: 16,),
                  Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedKategoriId.value,
                      decoration: Styles.dropdownDecoration("Kategori"),
                      items: controller.kategoriEditList.map<DropdownMenuItem<int>>((kategori) {
                        return DropdownMenuItem<int>(
                          value: kategori['id_kategori'],
                          child: Text(kategori['namakategori']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedKategoriId.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Kategori wajib dipilih" : null,
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
                  controller.editsubKategori();
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