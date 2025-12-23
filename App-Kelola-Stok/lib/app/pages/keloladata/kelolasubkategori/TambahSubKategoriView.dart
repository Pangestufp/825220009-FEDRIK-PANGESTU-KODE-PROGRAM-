import 'package:aplikasiinventorytokopulaubaru/app/controllers/SubKategoriController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahSubKategoriView extends GetView<SubKategoriController> {
  const TambahSubKategoriView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
      controller.selectedKategoriId.value=null;
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH SUBKATEGORI"),
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
                  items: controller.kategoriList.map<DropdownMenuItem<int>>((kategori) {
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
                            controller.tambahsubKategori();
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