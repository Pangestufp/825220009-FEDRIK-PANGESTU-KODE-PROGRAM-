import 'package:aplikasiinventorytokopulaubaru/app/controllers/ReturController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangReturCart extends GetView<ReturController> {
  const KelolaBarangReturCart({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAvaiById(Get.arguments['id_faktur']);
    });

    return Scaffold(
      appBar: Styles.bar("Menambahkan Retur"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===========================
              // DROPDOWN TIPE RETUR
              // ===========================
              DropdownButtonFormField<int>(
                decoration: Styles.dropdownDecoration("Tipe Retur"),
                value: controller.selectedid_tipe.value,
                items: controller.tipeList.map((s) {
                  return DropdownMenuItem<int>(
                    value: s['id_tipe'],
                    child: Text(s['namatipe']),
                  );
                }).toList(),
                onChanged: (val) {
                  controller.selectedid_tipe.value = val!;
                },
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: controller.detailfakturList.map((item) {
                    final idBarang = item['id_barang'];

                    final maxRetur =
                        int.tryParse(item['maxretur'].toString()) ?? 0;

                    // qty current
                    final qty = controller.returQty[idBarang] ?? 0;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // =============================
                            // NAMA BARANG
                            // =============================
                            Text(
                              item['namatext'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // =============================
                            // DETAIL BARANG
                            // =============================
                            Text(
                              "Harga: ${Styles.formatMoneyRp(item['harga'])}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Jumlah di Faktur: ${item['jumlah']}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Max Retur: ${item['maxretur']}",
                              style: const TextStyle(fontSize: 14),
                            ),

                            const SizedBox(height: 10),

                            // =============================
                            // QTY BUTTON
                            // =============================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => controller.reduceQty(idBarang),
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),

                                Text(
                                  "$qty",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () => controller.addQty(idBarang, maxRetur),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );


                  }).toList(),
                ),
              ),
            ],
          );
        }),
      ),

      // ===========================
      // BOTTOM BUTTON
      // ===========================
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
              final idFaktur = Get.arguments['id_faktur'];

              // VALIDASI minimal ada 1 qty > 0
              final totalDipilih = controller.returQty.values
                  .fold<int>(0, (sum, item) => sum + (item ?? 0));

              if (totalDipilih == 0) {
                Get.snackbar(
                  "Gagal",
                  "Tidak ada barang yang dipilih untuk retur",
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }

              controller.tambahRetur(idFaktur);
            },
            child: controller.isLoading.value
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                const Text("Menyimpan..."),
              ],
            )
                : const Text("Simpan"),
          ),
        ),
      ),
    );
  }
}


TableRow buildDetailRow(String label, String? value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text("  :  "),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          value ?? "-",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
