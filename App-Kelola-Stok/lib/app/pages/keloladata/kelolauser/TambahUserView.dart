import 'package:aplikasiinventorytokopulaubaru/app/controllers/PenggunaController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahUserView extends GetView<PenggunaController> {
  const TambahUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.clean();
    });

    return Scaffold(
      appBar: Styles.bar("TAMBAH PENGGUNA"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: Styles.underlineInput("Nama"),
                validator: (value) =>
                value == null || value.isEmpty ? "Nama wajib diisi" : null,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: Styles.underlineInput("Email"),
                validator: (value) =>
                value == null || value.isEmpty ? "Email wajib diisi" : null,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: Styles.underlineInput("Password"),
                obscureText: true,
                validator: (value) =>
                value == null || value.isEmpty ? "Password wajib diisi" : null,
              ),
              TextFormField(
                controller: controller.alamatController,
                decoration: Styles.underlineInput("Alamat"),
                validator: (value) =>
                value == null || value.isEmpty ? "Alamat wajib diisi" : null,
              ),
              const SizedBox(height: 16),
              Obx(
                    () => DropdownButtonFormField<String>(
                  value: controller.role.value,
                  decoration: Styles.dropdownDecoration("Role"),
                  items: const [
                    DropdownMenuItem(value: "partner", child: Text("Partner")),
                    DropdownMenuItem(value: "karyawan", child: Text("Karyawan")),
                  ],
                  onChanged: (val) {
                    if (val != null) controller.role.value = val;
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
                            controller.tambahUser();
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