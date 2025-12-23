import 'package:aplikasiinventorytokopulaubaru/app/controllers/PesananController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaPesananMitra extends GetView<PesananController> {
  const KelolaPesananMitra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Kelola Pesanan Partner',
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
              if (controller.pesananList.isEmpty) {
                return const Center(child: Text("Tidak ada data Pembelian"));
              }
              return ListView.separated(
                itemCount: controller.pesananList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final pesanan = controller.pesananList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Styles.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.receipt_long, color: Styles.primaryColor),
                    ),
                    title: Text(
                      pesanan['id_transaksi'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama: ${pesanan['name'] ?? '-'}"),
                        Text("Status: ${pesanan['statuspesanan'] ?? '-'}",
                            style: TextStyle(
                              color: Styles.getStatusColor(pesanan['statuspesanan']),
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Tanggal: ${Styles.formatDate(pesanan['createat']) ?? ''}"),
                      ],
                    ),
                    onTap: (){
                      controller.selectedid_transaksi.value = pesanan['id_transaksi'];
                      Get.toNamed(Routes.KELOLA_PESANAN_MITRA_ACTION, arguments: pesanan);
                    },
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          Styles.formatMoneyRp(pesanan['total']),
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
    );
  }
}