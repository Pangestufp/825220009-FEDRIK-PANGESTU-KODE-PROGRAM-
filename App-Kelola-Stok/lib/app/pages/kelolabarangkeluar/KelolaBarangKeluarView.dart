import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangKeluarController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangKeluarView extends GetView<BarangKeluarController> {
  const KelolaBarangKeluarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Kelola Penjualan',
          style: TextStyle(color: Styles.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Styles.tertiaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
                ));
              }
              if (controller.barangKeluarList.isEmpty) {
                return const Center(child: Text("Tidak ada data Barang Keluar"));
              }
              return ListView.separated(
                itemCount: controller.barangKeluarList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final barangKeluar = controller.barangKeluarList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Styles.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.receipt_long, color: Styles.primaryColor),
                    ),
                    title: Text(
                      barangKeluar['id_transaksi'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama: ${barangKeluar['name'] ?? '-'}"),
                        Text("Status: ${barangKeluar['status'] ?? '-'}",
                            style: TextStyle(
                              color: barangKeluar['status'] == 'selesai'
                                  ? Colors.blue
                                  : Colors.orange,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Tanggal: ${Styles.formatDate(barangKeluar['createat']) ?? ''}"),
                      ],
                    ),
                    onTap: (){
                      Get.toNamed(Routes.KELOLA_BARANGKELUAR_DETAIL, arguments: barangKeluar);
                    },
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          Styles.formatMoneyRp(barangKeluar['total']),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.toNamed(Routes.KELOLA_BARANGKELUAR_ADD);
        },
      ),
    );
  }
}
