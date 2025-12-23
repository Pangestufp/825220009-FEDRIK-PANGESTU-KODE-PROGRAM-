import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangMasukController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/pages/kelolabarangmasuk/KelolaBarangMasukCartView.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangMasukAddView extends GetView<BarangMasukController> {
  const KelolaBarangMasukAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles.bar("Tambah Faktur Pembelian"),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<int>(
                decoration: Styles.dropdownDecoration("Supplier"),
                value: controller.selectedSupplier.value,
                items: controller.supplierList.map((s) {
                  return DropdownMenuItem<int>(
                    value: s['id_supplier'],
                    child: Text("${s['namasupplier']} (${s['namaperusahaan']}) ", style: TextStyle(fontSize: 14),),
                  );
                }).toList(),
                onChanged: (val) => controller.selectedSupplier.value = val,
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: Styles.underlineInput("Biaya Tambahan"),
                keyboardType: TextInputType.number,
                onChanged: (val) =>
                controller.biayaTambahan.value = double.tryParse(val) ?? 0,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: Styles.dropdownDecoration("Jenis Pembelian"),
                value: controller.selectedStatus.value,
                items: const [
                  DropdownMenuItem(value: "tunai", child: Text("Tunai")),
                  DropdownMenuItem(value: "kredit", child: Text("Kredit")),
                ],
                onChanged: (val) => controller.selectedStatus.value = val!,
              ),
              const SizedBox(height: 16),


              if (controller.selectedStatus.value == "kredit")
                ListTile(
                  title: const Text("Tanggal Jatuh Tempo"),
                  subtitle: Text(
                      "${controller.dueDate.value.toLocal()}".split(' ')[0]),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => controller.pickDueDate(context),
                ),
              const SizedBox(height: 16),
              Obx(() {
                if (controller.cartList.isEmpty) {
                  return const Text("Belum ada barang dipilih");
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.cartList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final barang = controller.cartList[index];
                    final hargaController = TextEditingController(
                      text: barang['harga']?.toString() ?? '',
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
                                child: Text(
                                  "${barang['namatext']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
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
                            controller: hargaController,
                            keyboardType: TextInputType.number,
                            decoration: Styles.underlineInput( "Harga Beli",
                            ),
                            onChanged: (val) {
                              final harga = double.tryParse(val) ?? 0;
                              controller.cartList[index]['harga'] = harga;
                            },
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: jumlahController,
                            keyboardType: TextInputType.number,
                            decoration: Styles.underlineInput("Jumlah"),
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ ElevatedButton.icon(
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Tambahkan Barang"),
                    onPressed: () {
                      Get.toNamed(Routes.KELOLA_BARANGMASUK_CART);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ]
                ),
              ),
              const SizedBox(height: 16),

            ],
          ),


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
              (item['harga'] == null || item['harga'] <= 0) ||
                  (item['jumlah'] == null || item['jumlah'] <= 0)
              );



              if (invalidItem || controller.selectedSupplier.value == null) {
                Get.snackbar(
                  "Error",
                  "Pastikan semua barang punya Harga  dan Jumlah yang valid",
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
                          controller.tambahBarangMasuk();
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