import 'package:aplikasiinventorytokopulaubaru/app/controllers/TesController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaTesView extends GetView<TesController> {
  const KelolaTesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'KELOLA DATA',
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
                decoration: Styles.roundedInput("Cari Data"),
                onChanged: (value) => controller.searchTes(value),
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
                return const Center(child: Text("Tidak ada data"));
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
                  final perusahaan = controller.filteredList[index];
                  return ListTile(
                    leading: Icon(Icons.account_box_rounded,color: Styles.primaryColor, size: 50,),
                    title: Text(perusahaan['kolom1'] ?? '-'),
                    subtitle: Text(perusahaan['kolom2'] ?? '-'),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, color: Styles.primaryColor),
                      onPressed: () {
                        controller.selecteddetail.value=0;
                        controller.selecteddetail.value=perusahaan['id_tes'];
                        Get.toNamed(Routes.KELOLA_DETAIL_TES);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Styles.primaryColor,
      //   child: const Icon(Icons.add, color: Colors.white),
      //   onPressed: () {
      //     Get.toNamed(Routes.KELOLA_MENAMBAHKAN_TES);
      //   },
      // ),

      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 80.0,
            right: 4.0,
            child: FloatingActionButton(
                backgroundColor: Styles.primaryColor,
                child: const Icon(Icons.add, color: Colors.white),
                heroTag: "Create",
                onPressed: () {
                  Get.toNamed(Routes.KELOLA_MENAMBAHKAN_TES);
                },
              ),
          ),
          Positioned(
            bottom: 150.0,
            right: 4.0,
            child: FloatingActionButton(
              backgroundColor: Styles.primaryColor,
              child: const Icon(Icons.print, color: Colors.white),
              heroTag: "Print",
              onPressed: () {
                controller.openLaporanPDF();

              },
            ),
          ),
        ],
      ),

    );
  }
}
