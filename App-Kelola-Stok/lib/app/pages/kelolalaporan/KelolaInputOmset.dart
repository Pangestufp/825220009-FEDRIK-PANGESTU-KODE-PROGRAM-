import 'package:aplikasiinventorytokopulaubaru/app/controllers/LaporanController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KelolaInputOmset extends GetView<LaporanController> {
  const KelolaInputOmset({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Styles.bar("Kelola Omset Penjualan"),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ));
                }

                final log = controller.logData;

                return SingleChildScrollView(
                  child: Container(
                    decoration: Styles.radiusDown,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: log.isNotEmpty
                            ? buildDetailTable(log)
                            : const Text(
                          "Belum ada log omset.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.dataController,
                keyboardType: TextInputType.number,
                decoration: Styles.underlineInput("Input Omset Baru"),
              ),
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),

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
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.inputOmsetData();
                        },
                        child: const Text("Simpan"),
                      ),
                    ],
                  );
                },
              );
            },
            child: controller.isLoading.value
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
                : const Text("Buat"),
          ),
        ),
      ),

    );
  }

}


Widget buildDetailTable(Map<String, dynamic> user) {
  final totalSistem = double.tryParse(user['totalhitungansistem'].toString()) ?? 0;
  final omsetInput = double.tryParse(user['omsetinput'].toString()) ?? 0;

  final selisih = omsetInput-totalSistem;
  return Table(
    columnWidths: const {
      0: IntrinsicColumnWidth(),
      1: FixedColumnWidth(20),
      2: FlexColumnWidth(),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      buildDetailRow("Arus Kas Hari Ini ", ""),
      buildDetailRow("Omset Tunai ", Styles.formatMoneyRp(user['omsetinput'])),
      buildDetailRow("Omset Sistem ", Styles.formatMoneyRp(user['totalhitungansistem'])),
      buildDetailRow("Selisih", Styles.formatMoneyRp(selisih.toString())),
      buildDetailRow("Total Keuntungan", Styles.formatMoneyRp(user['totalkeuntungan'])),
      buildDetailRow("Waktu terakhir berubah", user['updateat']),
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
