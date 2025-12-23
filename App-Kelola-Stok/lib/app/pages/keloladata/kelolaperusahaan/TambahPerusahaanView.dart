import 'package:aplikasiinventorytokopulaubaru/app/controllers/PerusahaanController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahPerusahaanView extends GetView<PerusahaanController> {
  const TambahPerusahaanView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH PERUSAHAAN"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.namaperusahaanController,
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
              TextFormField(
                controller: controller.kontakController,
                decoration: Styles.underlineInput("Kontak"),
                validator: (value) =>
                value == null || value.isEmpty ? "Kontak wajib diisi" : null,
              ),
              TextFormField(
                controller: controller.alamatController,
                decoration: Styles.underlineInput("Alamat"),
                validator: (value) =>
                value == null || value.isEmpty ? "Alamat wajib diisi" : null,
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
                            controller.tambahPerusahaan();
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