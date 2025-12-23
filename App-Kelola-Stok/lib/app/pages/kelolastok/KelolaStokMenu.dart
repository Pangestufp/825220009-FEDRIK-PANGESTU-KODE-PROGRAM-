import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaStokMenu extends GetView<StokController> {
  const KelolaStokMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.secondaryColor,
        appBar: Styles.bar("Kelola Stok"),

        body: SingleChildScrollView(
            child: Column(
              children: [
                _buildMenuItem(
                  label: 'Stok OpName',
                  onTap: () => Get.toNamed(Routes.KELOLA_STOKOPNAME_INPUT),
                ),
                _buildMenuItem(
                  label: 'History Koreksi',
                  onTap: () => Get.toNamed(Routes.KELOLA_HISTORY_STOK),
                ),
                _buildMenuItem(
                  label: 'Laporan Stok',
                  onTap: () => Get.toNamed(Routes.KELOLA_LAPORAN_STOK),
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
