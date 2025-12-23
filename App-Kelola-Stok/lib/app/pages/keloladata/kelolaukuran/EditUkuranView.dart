import 'package:aplikasiinventorytokopulaubaru/app/controllers/UkuranController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUkuranView extends GetView<UkuranController> {
  const EditUkuranView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
        controller.setFormData(Get.arguments);

    return Scaffold(
        appBar: Styles.bar("EDIT UKURAN"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.ukuranController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.underlineInput("Ukuran "),
                    validator: (value) =>
                    value == null || value.isEmpty ? "Ukuran wajib diisi" : null,
                  ),
                  SizedBox(height: 16,),
                  Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedsatuanId.value,
                      decoration: Styles.dropdownDecoration("Satuan"),
                      items: controller.satuanEditList.map<DropdownMenuItem<int>>((satuan) {
                        return DropdownMenuItem<int>(
                          value: satuan['id_satuan'],
                          child: Text(satuan['namasatuan']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedsatuanId.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Satuan wajib dipilih" : null,
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
                  controller.editukuran();
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