import 'package:aplikasiinventorytokopulaubaru/app/controllers/SupplierController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahSupplierView extends GetView<SupplierController> {
  const TambahSupplierView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
      controller.selectedPerusahaanId.value=null;
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH SUPPLIER"),
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
                  items: controller.perusahaanList.map<DropdownMenuItem<int>>((kategori) {
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
                            controller.tambahsupplier();
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