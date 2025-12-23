import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/VarianController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailVarianView extends GetView<VarianController> {
  const DetailVarianView({super.key});


  @override
  Widget build(BuildContext context) {
    final int id = controller.selecteddetail.value;


    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchVarianById(id);
    });

    return Scaffold(
      appBar: Styles.bar("DETAIL VARIAN"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final barang = controller.varianDetail.value;
        if (barang == null) {
          return const Center(child: Text("Data Varian tidak ditemukan"));
        }

        return Container(
          height: MediaQuery.of(context).size.height/2,
          decoration: Styles.radiusDown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailTable(barang),
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
                                        controller.deleteVarian(id);
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
                            Get.toNamed(Routes.KELOLA_EDIT_VARIAN, arguments: barang);
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
      buildDetailRow("Subkategori", user['namasubkategori']),
      buildDetailRow("Ukuran", "${user['ukuran']} ${user['namasatuan']}"),
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