import 'package:aplikasiinventorytokopulaubaru/app/controllers/UkuranController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahUkuranView extends GetView<UkuranController> {
  const TambahUkuranView({super.key});



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
      controller.selectedsatuanId.value=null;
    });
    return Scaffold(
      appBar: Styles.bar("TAMBAH UKURAN"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.ukuranController,
                keyboardType: TextInputType.number,
                decoration: Styles.underlineInput("Ukuran"),
                validator: (value) =>
                value == null || value.isEmpty ? "Ukuran" : null,
              ),
              SizedBox(height: 16,),
              Obx(
                    () => DropdownButtonFormField<int>(
                  value: controller.selectedsatuanId.value,
                  decoration: Styles.dropdownDecoration("Satuan"),
                  items: controller.satuanList.map<DropdownMenuItem<int>>((satuan) {
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
                            controller.tambahUkuran();
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