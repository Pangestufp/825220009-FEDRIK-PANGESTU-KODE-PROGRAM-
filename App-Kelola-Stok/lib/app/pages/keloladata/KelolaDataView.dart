import 'package:aplikasiinventorytokopulaubaru/app/controllers/MenuUtamaController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaDataView extends GetView<MenuUtamaController>  {
  const KelolaDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text( 'Kelola Data',style: TextStyle(color: Styles.primaryColor)),
        centerTitle: true,
        backgroundColor: Styles.tertiaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),

        body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMenuItem(
              label: 'KELOLA PENGGUNA',
              onTap: () => Get.toNamed(Routes.KELOLA_USER),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA PROFIL TOKO',
              onTap: () => Get.toNamed(Routes.KELOLA_DETAIL_PROFILTOKO),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA PERUSAHAAN',
              onTap: () => Get.toNamed(Routes.KELOLA_PERUSAHAAN),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA SUPPLIER',
              onTap: () => Get.toNamed(Routes.KELOLA_SUPPLIER),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA KATEGORI',
              onTap: () => Get.toNamed(Routes.KELOLA_KATEGORI),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA SUBKATEGORI',
              onTap: () => Get.toNamed(Routes.KELOLA_SUBKATEGORI),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA BRAND',
              onTap: () => Get.toNamed(Routes.KELOLA_BRAND),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA SATUAN',
              onTap: () => Get.toNamed(Routes.KELOLA_SATUAN),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA UKURAN',
              onTap: () => Get.toNamed(Routes.KELOLA_UKURAN),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA VARIAN',
              onTap: () => Get.toNamed(Routes.KELOLA_VARIAN),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA TIPE',
              onTap: () => Get.toNamed(Routes.KELOLA_TIPE),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA BARANG',
              onTap: () => Get.toNamed(Routes.KELOLA_BARANG),
            ),
            const Divider(height: 1, thickness: 1, color: Styles.primaryColor),
            _buildMenuItem(
              label: 'KELOLA HARGA BARANG',
              onTap: () => Get.toNamed(Routes.KELOLA_HARGABARANG),
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

