import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryStokDetail extends GetView<StokController> {
  const HistoryStokDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchDetailLog(id);
    });

    return Scaffold(
      appBar: Styles.bar("Detail Koreksi"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final log = controller.logDetail.value;
        if (log == null) {
          return const Center(child: Text("Data log tidak ditemukan"));
        }

        final List<dynamic> dataJson = log["data_json"] ?? [];

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              width: MediaQuery.of(context).size.width,
              decoration: Styles.radiusDown,
              child:Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID Log: ${log["id_logperubahan"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Text("User nama: ${controller.selectedValue.value}"),
                    Text("Tanggal: ${log["createat"]}"),
                    const SizedBox(height: 8),
                    Text("Alasan: ${log["alasan"]}",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey)),
                  ],
                ),
              ),
              ),
              const SizedBox(height: 15),
              Padding(
                  padding: EdgeInsets.all(10),
                child:
                Column(
                  children: [
                    const Text(
                      "Perubahan Stok",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataJson.length,
                      itemBuilder: (context, index) {
                        final item = dataJson[index];
                        final sebelum = item["sebelum"] as int;
                        final sesudah = item["sesudah"] as int;
                        final selisih = sesudah - sebelum;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            title: Text(item["namatext"]),
                            subtitle: Text("Sebelum: $sebelum | Sesudah: $sesudah"),
                            trailing: Text(
                              (selisih > 0 ? "+$selisih" : "$selisih"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selisih > 0 ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
