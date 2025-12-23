import 'package:aplikasiinventorytokopulaubaru/app/controllers/ProfilTokoController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProfilTokoView extends GetView<ProfilTokoController> {
  const DetailProfilTokoView({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: Styles.bar("KELOLA PROFIL TOKO"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profil = controller.profilDetail.value;
        if (profil == null) {
          return const Center(child: Text("Data Profil tidak ditemukan"));
        }

        return Container(
          height: MediaQuery.of(context).size.height/1.5,
          decoration: Styles.radiusDown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailTable(profil),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.KELOLA_EDIT_PROFILTOKO,arguments: profil);
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
      buildDetailRow("Nama", user['nama']),
      buildDetailRow("Alamat", user['alamat']),
      buildDetailRow("Email", user['email']),
      buildDetailRow("kontak Wa", user['kontakwa']),
      buildDetailRow("Persen Partner Profit", user['persenmitraprofit']+"%"),
      buildDetailRow("Persen Profit Estimasi", user['persenprofitestimasi']+"%"),

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