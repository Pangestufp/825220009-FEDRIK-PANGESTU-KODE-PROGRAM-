import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangMasukController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangMasukDetailView extends GetView<BarangMasukController> {
  const KelolaBarangMasukDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchFakturDetailById(Get.arguments['id_faktur']);
    });

    final header = Get.arguments;

    return Scaffold(
      appBar: Styles.bar("Detail Faktur"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final detailList = controller.detailfakturList;
        if (detailList.isEmpty) {
          return const Center(child: Text("Detail Faktur tidak ditemukan"));
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
                      buildDetailRow("Nama Perusahaan", header['namaperusahaan']),
                      buildDetailRow("Nama Agen Supplier", header['namasupplier']),
                      buildDetailRow("Total Harga Barang", Styles.formatMoneyRp(header['totalhargabarang'])),
                      buildDetailRow("Total Biaya Tambahan", Styles.formatMoneyRp(header['biayatambahan'])),
                      buildDetailRow("Batas Bayar", header['duedate']),
                      buildDetailRow("Status", header['status']),
                      buildDetailRow("Waktu Terakhir Berubah", header['updateat']),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Detail Faktur",
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
                        Text("Harga: ${Styles.formatMoneyRp(item['harga'])}"),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text("Apakah Anda yakin ingin menyimpan?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            if(header['status'] != 'lunas') {
                              controller.editStatus(header["id_faktur"]);

                            }else{

                              Get.snackbar(
                                "Error",
                                "Faktur sudah lunas",
                                snackPosition: SnackPosition.BOTTOM,
                              );

                            }
                          },
                          child: Text("Simpan"),
                        ),
                      ],
                    );
                  },
                );

            },
            child: controller.isUpdating.value
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
                : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.task, color: Colors.cyanAccent,size: 50,),
                Text("Selesai"),
              ],
            ),
          ),
        ),
      ),
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