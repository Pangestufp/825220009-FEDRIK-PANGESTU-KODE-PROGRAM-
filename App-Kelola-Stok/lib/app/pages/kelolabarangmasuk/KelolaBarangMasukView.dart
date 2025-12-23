import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangMasukController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangMasukView extends GetView<BarangMasukController> {
  const KelolaBarangMasukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Kelola Pembelian',
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
              if (controller.fakturList.isEmpty) {
                return const Center(child: Text("Tidak ada data Faktur"));
              }
              return ListView.separated(
                itemCount: controller.fakturList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final faktur = controller.fakturList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Styles.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.receipt_long, color: Styles.primaryColor),
                    ),
                    title: Text(
                      Styles.formatDate(faktur['createat']),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Perusahaan :"),
                        Text("${faktur['namaperusahaan'] ?? '-'}"),
                        Text("Nama Supplier: ${faktur['namasupplier'] ?? '-'}"),
                        /*Text(
                          "Total : "+Styles.formatMoneyRp(faktur['totalhargabarang']),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),*/
                        Text("Status: ${faktur['status'] ?? '-'}",
                            style: TextStyle(
                              color: faktur['status'] == 'lunas'
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Batas Waktu: ${Styles.formatDate(faktur['duedate']) ?? ''}"),
                      ],
                    ),
                    onTap: (){
                      Get.toNamed(Routes.KELOLA_BARANGMASUK_DETAIL, arguments: faktur);
                    },
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          Styles.formatMoneyRp(faktur['totalhargabarang']),
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