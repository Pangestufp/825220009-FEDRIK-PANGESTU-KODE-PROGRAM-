import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangKeluarController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangKeluarDetail extends GetView<BarangKeluarController> {
  const KelolaBarangKeluarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchBarangKeluarDetailById(Get.arguments['id_transaksi']);
    });

    final header = Get.arguments;
    print(header);

    return Scaffold(
      appBar: Styles.bar("Detail Transaksi"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final detailList = controller.detailBarangKeluarList;
        if (detailList.isEmpty) {
          return const Center(child: Text("Detail barang keluar tidak ditemukan"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FixedColumnWidth(20),
                      2: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: [
                      buildDetailRow("ID Transaksi", header['id_transaksi']),
                      buildDetailRow("Nama", header['name']),
                      buildDetailRow("Status", header['status']),
                      buildDetailRow("Total", Styles.formatMoneyRp(header['total'])),
                      buildDetailRow("Tanggal", header['createat']),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Detail Barang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: detailList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor.withOpacity(0.3),
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final item = detailList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Styles.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.shopping_bag, color: Styles.primaryColor),
                    ),
                    title: Text(
                      item['namatext'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harga: ${Styles.formatMoneyRp(item['hargajual'])}"),
                        Text("Jumlah: ${item['jumlah']}"),
                      ],
                    ),
                    trailing: Text(
                      Styles.formatMoneyRp(item['total']),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

TableRow buildDetailRow(String label, String? value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: Text(":"),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(
          value ?? "-",
          style: const TextStyle(fontSize: 14),
        ),
      ),
    ],
  );
}