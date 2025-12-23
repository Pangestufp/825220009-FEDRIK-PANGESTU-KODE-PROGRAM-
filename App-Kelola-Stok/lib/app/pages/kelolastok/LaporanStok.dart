import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanStok extends GetView<StokController> {
  const LaporanStok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'Laporan Stok',
          style: TextStyle(color: Styles.primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Styles.tertiaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Styles.primaryColor),
      ),
      body: Column(
        children: [
          Container(
            decoration: Styles.radiusDownTertiary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: Styles.whiteTextField(),
                decoration: Styles.roundedInput("Cari Barang"),
                onChanged: (value) => controller.searchBarang(value),
              ),
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Styles.primaryColor),
                ));
              }
              if (controller.filteredList.isEmpty) {
                return const Center(child: Text("Tidak ada data Barang"));
              }
              return ListView.separated(
                itemCount: controller.filteredList.length,
                separatorBuilder: (context, index) =>
                    Divider(
                      color: Styles.primaryColor,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                itemBuilder: (context, index) {
                  final barang = controller.filteredList[index];
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
                      trailing: Text("${barang['stok']}")
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