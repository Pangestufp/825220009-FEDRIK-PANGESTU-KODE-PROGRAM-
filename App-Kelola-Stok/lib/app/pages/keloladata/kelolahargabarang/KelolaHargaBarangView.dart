import 'package:aplikasiinventorytokopulaubaru/app/controllers/HargaBarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class KelolaHargaBarangView extends GetView<HargaBarangController> {
  const KelolaHargaBarangView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: Styles.bar("KELOLA HARGA BARANG"),
      body: Column(
        children: [
          Container(
            decoration: Styles.radiusDownTertiary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: Styles.whiteTextField(),
                decoration: Styles.roundedInput("Cari Harga Barang"),
                onChanged: (value) => controller.searchBarang(value),
              ),
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
                ));
              }
              if (controller.filteredBarangList.isEmpty) {
                return const Center(child: Text("Tidak ada data Harga Barang"));
              }
              return ListView.separated(
                itemCount: controller.filteredBarangList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final barang = controller.filteredBarangList[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: "${EndPoints.imageUrl}${barang['imagepath']}",
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image, size: 48, color: Colors.grey),
                    ),

                    title: Text(barang['namatext'] ?? '-'),
                    subtitle: Text(
                      (barang['hargabeli'] != null && barang['hargabeli'].toString() != 'null')
                          ? "Rp ${NumberFormat.decimalPattern('id').format(double.parse(barang['hargabeli'].toString()).toInt())}"
                          : 'Belum ada harga yang diatur',
                      style: TextStyle(
                       color: (barang['hargabeli'] != null && barang['hargabeli'].toString() != 'null')
                           ? Colors.black
                           : Colors.red
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, color: Styles.primaryColor),
                      onPressed: () {
                        Get.toNamed(Routes.KELOLA_LIST_HARGABARANG, arguments: barang);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),

    );
  }
}