import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StokOpNameKoreksi extends GetView<StokController> {
  const StokOpNameKoreksi({super.key});

  @override
  Widget build(BuildContext context) {
    final alasanController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Input Koreksi Stok")),
      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            TextField(
              controller: alasanController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: Styles.underlineInput("Alasan Koreksi",
              ),
            ),
            const SizedBox(height: 12),

            ...controller.koreksiList.map((item) {
              return Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.inventory_2,
                    size: 40,
                    color: Styles.primaryColor,
                  ),
                  title: Text(item["namatext"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stok Sistem: ${item['jumlahsistem']}"),
                      Text("Input Sebelumnya: ${item['jumlahinput']}"),
                      Text("Selisih: ${item['selisih']}"),
                      TextField(
                        controller: item["stokinput"],
                        keyboardType: TextInputType.number,
                        decoration: Styles.underlineInput( "Stok Koreksi",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),


          ],
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
                            controller.simpanKoreksi(alasanController.text);
                          },
                          child: const Text("Simpan Koreksi"),
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