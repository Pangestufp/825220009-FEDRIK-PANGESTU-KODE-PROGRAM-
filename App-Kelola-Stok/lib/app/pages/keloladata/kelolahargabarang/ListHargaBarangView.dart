import 'package:aplikasiinventorytokopulaubaru/app/controllers/HargaBarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListHargaBarangView extends GetView<HargaBarangController> {
  const ListHargaBarangView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.fetchhargabarang(Get.arguments['id_barang']);
    });
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: Styles.bar("KELOLA HARGA"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: Styles.radiusDown,
            child: buildDetailTable(Get.arguments),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
                ));
              }
              if (controller.hargaBarangList.isEmpty) {
                return const Center(child: Text("Tidak ada data Harga"));
              }
              return ListView.separated(
                itemCount: controller.hargaBarangList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final harga = controller.hargaBarangList[index];
                  return ListTile(
                    leading: Icon(harga['pilihan']==1?Icons.bookmark:Icons.bookmark_border_outlined,color: Styles.primaryColor, size: 50,),
                    title: Text("Rp ${NumberFormat.decimalPattern('id').format(double.parse(harga['hargabeli'].toString()).toInt())}" ?? '-'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanggal dibuat: "+Styles.formatDate(harga['createat'])),
                        Text("Tanggal diubah: "+Styles.formatDate(harga['updateat']))
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                          onPressed: () {
                            controller.setFormData(harga);
                            Get.toNamed(Routes.KELOLA_EDIT_HARGABARANG,
                                arguments: Get.arguments);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                          onPressed: () {
                            controller.setFormData(harga);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Konfirmasi"),
                                  content: Text(
                                      "Apakah Anda yakin ingin menghapus?"),
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
                                        controller.delete();
                                      },
                                      child: Text("Hapus"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
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
          Get.toNamed(Routes.KELOLA_MENAMBAHKAN_HARGABARANG, arguments: Get.arguments);
        },
      ),
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
      buildDetailRow("Nama", user['namatext']),
      buildDetailRow("Deskripsi", user['deskripsi']),
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