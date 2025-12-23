import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/VarianController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVarianView extends GetView<VarianController> {
  const EditVarianView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
        controller.setFormData(Get.arguments);
    });

    return Scaffold(
        appBar: Styles.bar("EDIT VARIAN"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Obx(

                        () => DropdownButtonFormField<int>(
                      value: controller.selectedid_subkategori.value,
                      decoration: Styles.dropdownDecoration("Sub Kategori"),
                      items: controller.subkategoriEditList.map<DropdownMenuItem<int>>((subkategori) {
                        return DropdownMenuItem<int>(
                          value: subkategori['id_subkategori'],
                          child: Text("${subkategori['namasubkategori']} (${subkategori['namakategori']})"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedid_subkategori.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Satuan wajib dipilih" : null,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedid_ukuran.value,
                      decoration: Styles.dropdownDecoration("Ukuran"),
                      items: controller.ukuranEditList.map<DropdownMenuItem<int>>((ukuran) {
                        return DropdownMenuItem<int>(
                          value: ukuran['id_ukuran'],
                          child: Text("${ukuran['ukuran']} ${ukuran['namasatuan']}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedid_ukuran.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Ukuran wajib dipilih" : null,
                    ),
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
                  controller.editbarang();
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