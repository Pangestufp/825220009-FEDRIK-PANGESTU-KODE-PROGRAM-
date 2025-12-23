import 'package:aplikasiinventorytokopulaubaru/app/controllers/TipeController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTipeView extends GetView<TipeController> {
  const DetailTipeView({super.key});


  @override
  Widget build(BuildContext context) {
    final int id = controller.selecteddetail.value;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchTipeById(id);
    });

    return Scaffold(
      appBar: Styles.bar("DETAIL TIPE"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final tipe = controller.tipeDetail.value;
        if (tipe == null) {
          return const Center(child: Text("Data Tipe tidak ditemukan"));
        }

        return Container(
          height: MediaQuery.of(context).size.height/2,
          decoration: Styles.radiusDown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailTable(tipe),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Konfirmasi"),
                                  content: Text("Apakah Anda yakin ingin menghapus?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        controller.deleteTipe(id);
                                      },
                                      child: Text("Hapus"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete, color: Colors.red, size: 50),
                        ),
                        const Text("Hapus")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.KELOLA_EDIT_TIPE, arguments: tipe);
                          },
                          icon: const Icon(Icons.edit, color: Colors.blue, size: 50),
                        ),
                        const Text("Edit")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      }),
    );
  }
}


Widget buildDetailTable(Map<String, dynamic> user) {
  return Table(
    columnWidths: const {
      0: IntrinsicColumnWidth(),
      1: FixedColumnWidth(20),
      2: FlexColumnWidth(),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      buildDetailRow("Nama", user['namatipe']),
      buildDetailRow("Tanggal Dibuat", user['createat']),
      buildDetailRow("Tanggal Diubah", user['updateat']),
    ],
  );
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