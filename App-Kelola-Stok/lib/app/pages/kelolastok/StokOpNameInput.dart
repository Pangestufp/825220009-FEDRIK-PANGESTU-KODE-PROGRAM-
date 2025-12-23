import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StokOpNameInput extends GetView<StokController> {
  const StokOpNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles.bar("Input Stok Opname"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.barangList.isEmpty) {
          return const Center(child: Text("Tidak ada barang"));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.barangList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final barang = controller.barangList[index];
            final idBarang = barang['id_barang'];
            final namaBarang = barang['namatext'] ?? '-';

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(namaBarang + " Jumlah : "+controller.stokInputMap[idBarang]?.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: Styles.underlineInput("Stok Input"),
                      onChanged: (val) {
                        final input = int.tryParse(val) ?? -1;
                        controller.stokInputMap[idBarang] = input;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
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
            onPressed: controller.isLoading.value
                ? null
                : () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Konfirmasi"),
                    content: const Text("Apakah Anda yakin ingin membandingkan stok?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          controller.koreksi();
                        },
                        child: const Text("Kirim"),
                      ),
                    ],
                  );
                },
              );
            },
            child: controller.isLoading.value
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
                Text("Loading..."),
              ],
            )
                : const Text("Buat"),
          ),
        ),
      ),
    );
  }
}