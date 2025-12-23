import 'dart:io';

import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/VarianController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahVarianView extends GetView<VarianController> {
  const TambahVarianView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.selectedid_ukuran.value=null;
      controller.selectedid_subkategori.value=null;
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH VARIAN"),
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
                  items: controller.subkategoriList.map<DropdownMenuItem<int>>((subkategori) {
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
                  items: controller.ukuranList.map<DropdownMenuItem<int>>((ukuran) {
                    return DropdownMenuItem<int>(
                      value: ukuran['id_ukuran'],
                      child: Text("${ukuran['ukuran']} ${ukuran['namasatuan']}"),
                    );
                  }).toList(),
                  onChanged: (val) {
                    controller.selectedid_ukuran.value = val;
                  },
                  validator: (value) =>
                  value == null ? "Satuan wajib dipilih" : null,
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text("Apakah Anda yakin ingin menyimpan?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            controller.tambahVarian();
                          },
                          child: const Text("Simpan"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: controller.isUpdating.value
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
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
                : const Text("Buat"),
          ),
        ),
      ),
    );
  }
}