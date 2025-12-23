import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/PesananController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';

class KelolaPesananReview extends GetView<PesananController> {
  const KelolaPesananReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Pesanan"),
        backgroundColor: Styles.primaryColor,
      ),
      body: Obx(() {
        final items = controller.detailBarangKeluarList;

        if (items.isEmpty) {
          return const Center(child: Text("Tidak ada data barang"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            final hargalama = Styles.formatMoneyRp(item["hargajual"]);
            final hargaController =
            TextEditingController(text: "${item["hargajual"]}".replaceAll(RegExp(r"\.00$"), ""));
            final jumlahController =
            TextEditingController(text: "${item["jumlah"]}");

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["namatext"] + " Harga Lama : "+hargalama,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),

                    TextField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harga Jual",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        controller.updateHarga(index, val);
                      },
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Jumlah",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        controller.updateJumlah(index, val);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Styles.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            controller.Review();
          },
          child: const Text("Simpan Perubahan"),
        ),
      ),
    );
  }
}
