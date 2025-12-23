import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangKeluarController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangKeluarCartView extends GetView<BarangKeluarController> {
  const KelolaBarangKeluarCartView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles.bar("Keranjang Barang"),
      body: Obx(() {
        if (controller.cartList.isEmpty) {
          return const Center(child: Text("Keranjang masih kosong"));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: controller.cartList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final barang = controller.cartList[index];
            final hargaJualController = TextEditingController(
              text: barang['hargajual']?.toString() ?? '',
            );
            final jumlahController = TextEditingController(
              text: barang['jumlah']?.toString() ?? '',
            );

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Styles.primaryColor.withOpacity(0.4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${barang['namatext']} (Sisa: ${barang['stok']})",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Harga Beli : ${Styles.formatMoneyRp(barang['hargabeli'])}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.removeFromCart(barang['id_barang']);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: hargaJualController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.underlineInput("Harga Jual"),
                    onChanged: (val) {
                      final harga = int.tryParse(val) ?? 0;
                      controller.cartList[index]['hargajual'] = harga;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.underlineInput(
                      "Jumlah"
                    ),
                    onChanged: (val) {
                      final jumlah = int.tryParse(val) ?? 0;
                      controller.cartList[index]['jumlah'] = jumlah;
                    },
                  ),
                ],
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
                  final invalidItem = controller.cartList.any((item) =>
                  (item['hargajual'] == null || item['hargajual'] <= 0) ||
                      (item['jumlah'] == null || item['jumlah'] <= 0)
                  );

                  if (invalidItem) {
                    Get.snackbar(
                      "Error",
                      "Pastikan semua barang punya Harga Jual dan Jumlah yang valid",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text("Apakah Anda yakin ingin menyimpan?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Batal"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              controller.tambahBarangKeluar();
                            },
                            child: const Text("Simpan"),
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