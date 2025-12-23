import 'package:aplikasiinventorytokopulaubaru/app/controllers/LaporanController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaLaporanKeuangan extends GetView<LaporanController> {
  const KelolaLaporanKeuangan({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.secondaryColor,
        appBar: Styles.bar("Laporan Keuangan"),

        body: SingleChildScrollView(
            child: Column(
              children: [
                _buildMenuItem(
                  label: 'Laporan Keuangan',
                  onTap: () => Get.toNamed(Routes.KELOLA_LAPORAN_KEUANGAN_DOWNLOAD),
                ),
                const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
                _buildMenuItem(
                  label: 'Input Omset Harian',
                  onTap: () => Get.toNamed(Routes.KELOLA_INPUT_OMSET),
                )
              ],

            )
        )
    );
  }

}


Widget _buildMenuItem({
  required String label,
  required VoidCallback onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Styles.secondaryColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: TextStyle(
          color: Styles.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.open_in_new_rounded,
        color: Styles.primaryColor,
      ),
    ),
  );
}
