import 'package:aplikasiinventorytokopulaubaru/app/controllers/TipeController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaTipeView extends GetView<TipeController> {
  const KelolaTipeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: Styles.bar("KELOLA TIPE"),
      body: Column(
        children: [
          Container(
            decoration: Styles.radiusDownTertiary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: Styles.whiteTextField(),
                decoration: Styles.roundedInput("Cari Tipe"),
                onChanged: (value) => controller.searchTipe(value),
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
                return const Center(child: Text("Tidak ada data Tipe"));
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
                  final tipe = controller.filteredList[index];
                  print(tipe);
                  return ListTile(
                    leading: Icon(Icons.tag,color: Styles.primaryColor, size: 50,),
                    title: Text(tipe['namatipe'] ?? '-'),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, color: Styles.primaryColor),
                      onPressed: () {
                        controller.selecteddetail.value=0;
                        controller.selecteddetail.value=tipe['id_tipe'];
                        Get.toNamed(Routes.KELOLA_DETAIL_TIPE);
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
          Get.toNamed(Routes.KELOLA_MENAMBAHKAN_TIPE);
        },
      ),
    );
  }
}
