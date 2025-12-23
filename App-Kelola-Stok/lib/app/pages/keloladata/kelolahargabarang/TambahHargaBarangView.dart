import 'package:aplikasiinventorytokopulaubaru/app/controllers/HargaBarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahHargaBarangView extends GetView<HargaBarangController> {
  const TambahHargaBarangView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.setFormData(Get.arguments);
    });

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: Styles.bar("TAMBAH HARGA BARANG"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.hargabeliController,
                keyboardType: TextInputType.number,
                decoration: Styles.underlineInput("Harga Beli"),
                validator: (value) =>
                value == null || value.isEmpty
                    ? "Harga beli wajib diisi"
                    : null,
              ),
              Obx(() => CheckboxListTile(
                title: const Text("Jadikan pilihan utama"),
                value: controller.pilihan.value == 1,
                activeColor: Styles.primaryColor,
                onChanged: (val) {
                  controller.pilihan.value = val! ? 1 : 0;
                },
              ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
              () =>
              ElevatedButton(
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
                          content: const Text(
                              "Apakah Anda yakin ingin menyimpan?"),
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
                                controller.tambahHargaBarang();
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
