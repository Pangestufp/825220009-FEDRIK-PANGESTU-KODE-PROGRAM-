import 'package:aplikasiinventorytokopulaubaru/app/controllers/SubKategoriController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaSubKategoriView extends GetView<SubKategoriController> {
  const KelolaSubKategoriView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'KELOLA SUBKATEGORI',
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
                decoration: Styles.roundedInput("Cari subKategori"),
                onChanged: (value) => controller.searchSubKategori(value),
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
              if (controller.filteredList.isEmpty) {
                return const Center(child: Text("Tidak ada data SubKategori"));
              }
              return ListView.separated(
                itemCount: controller.filteredList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Styles.primaryColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final subkategori = controller.filteredList[index];
                  return ListTile(
                    leading: Icon(Icons.tag,color: Styles.primaryColor, size: 50,),
                    title: Text(subkategori['namasubkategori'] ?? '-'),
                    subtitle: Text(subkategori['namakategori'] ?? '-'),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, color: Styles.primaryColor),
                      onPressed: () {
                        controller.selecteddetail.value=0;
                        controller.selecteddetail.value=subkategori['id_subkategori'];
                        Get.toNamed(Routes.KELOLA_DETAIL_SUBKATEGORI);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.toNamed(Routes.KELOLA_MENAMBAHKAN_SUBKATEGORI);
        },
      ),
    );
  }
}