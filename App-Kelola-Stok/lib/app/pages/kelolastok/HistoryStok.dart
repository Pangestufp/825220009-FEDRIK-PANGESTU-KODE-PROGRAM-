import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryStok extends GetView<StokController> {
  const HistoryStok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Histori Koreksi',
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
              if (controller.historyList.isEmpty) {
                return const Center(child: Text("Tidak ada data koreksi"));
              }
              return ListView.separated(
                itemCount: controller.historyList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final koreksi = controller.historyList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Styles.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.receipt_long, color: Styles.primaryColor),
                    ),
                    title: Text(
                      "Log Perubahan ${koreksi['id_logperubahan']}" ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Waktu Koreksi: "),
                        Text("${koreksi['createat'] ?? '-'}"),
                        Text("Nama Pengoreksi: ${koreksi['name'] ?? '-'}"),
                        Text("Alasan Koreksi: ${koreksi['alasan'] ?? ''}"),
                      ],
                    ),
                    onTap: (){
                      controller.selectedValue.value="";
                      controller.selectedValue.value="${koreksi['name'] ?? '-'}";
                      Get.toNamed(Routes.KELOLA_HISTORY_STOK_DETAIL, arguments: koreksi["id_logperubahan"]);
                    },
                    trailing: Icon(
                      Icons.open_in_new_rounded,
                      color: Styles.primaryColor,
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