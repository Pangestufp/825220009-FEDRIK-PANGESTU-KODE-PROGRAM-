import 'dart:io';

import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahBarangView extends GetView<BarangController> {
  const TambahBarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
      controller.selectedid_varian.value=null;
      controller.selectedid_brand.value=null;
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH BARANG"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.deskripsiController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: Styles.underlineInput("Deskripsi"),
                validator: (value) =>
                value == null || value.isEmpty ? "Deskripsi" : null,
              ),
              SizedBox(height: 16,),
              Obx(
                    () => DropdownButtonFormField<int>(
                  value: controller.selectedid_brand.value,
                  decoration: Styles.dropdownDecoration("Brand"),
                  items: controller.brandList.map<DropdownMenuItem<int>>((satuan) {
                    return DropdownMenuItem<int>(
                      value: satuan['id_brand'],
                      child: Text(satuan['namabrand']),
                    );
                  }).toList(),
                  onChanged: (val) {
                    controller.selectedid_brand.value = val;
                  },
                  validator: (value) =>
                  value == null ? "Brand wajib dipilih" : null,
                ),
              ),
              SizedBox(height: 16,),
              Obx(
                    () => DropdownButtonFormField<int>(
                  value: controller.selectedid_varian.value,
                  decoration: Styles.dropdownDecoration("Varian"),
                  items: controller.varianList.map<DropdownMenuItem<int>>((ukuran) {
                    return DropdownMenuItem<int>(
                      value: ukuran['id_varian'],
                      child: Text("${ukuran['namasubkategori']} ${ukuran['ukuran']} ${ukuran['namasatuan']}"),
                    );
                  }).toList(),
                  onChanged: (val) {
                    controller.selectedid_varian.value = val;
                  },
                  validator: (value) =>
                  value == null ? "Satuan wajib dipilih" : null,
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                final image = controller.selectedImage2.value;
                return GestureDetector(
                  onTap: () => {
                    controller.pickImage()},
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_a_photo, color: Styles.primaryColor, size: 40),
                          SizedBox(height: 8),
                          Text("Pilih Gambar", style: TextStyle(color: Styles.primaryColor)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
                            controller.tambahBarang();
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