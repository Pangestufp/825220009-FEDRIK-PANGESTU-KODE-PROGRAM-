import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangMasukController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangMasukMenu extends GetView<BarangMasukController> {
  const KelolaBarangMasukMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.secondaryColor,
        appBar: Styles.bar("Kelola Pembelian"),

        body: SingleChildScrollView(
            child: Column(
              children: [
                _buildMenuItem(
                  label: 'Menambahkan Pembelian',
                  onTap: () => Get.toNamed(Routes.KELOLA_BARANGMASUK_ADD),
                ),
                _buildMenuItem(
                  label: 'Kelola Status Pembelian',
                  onTap: () => Get.toNamed(Routes.KELOLA_BARANGMASUK),
                ),
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