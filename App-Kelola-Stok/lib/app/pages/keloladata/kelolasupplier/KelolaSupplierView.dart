import 'package:aplikasiinventorytokopulaubaru/app/controllers/SupplierController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaSupplierView extends GetView<SupplierController> {
  const KelolaSupplierView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondaryColor,
      appBar: AppBar(
        title: const Text(
          'KELOLA SUPPLIER',
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
                decoration: Styles.roundedInput("Cari Supplier"),
                onChanged: (value) => controller.searchSupplier(value),
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
                return const Center(child: Text("Tidak ada data Supplier"));
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
                    title: Text(perusahaan['namasupplier'] ?? '-'),
                    subtitle: Text(perusahaan['namaperusahaan'] ?? '-'),
                    trailing: IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, color: Styles.primaryColor),
                      onPressed: () {
                        controller.selecteddetail.value=0;
                        controller.selecteddetail.value=perusahaan['id_supplier'];
                        Get.toNamed(Routes.KELOLA_DETAIL_SUPPLIER);
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
          Get.toNamed(Routes.KELOLA_MENAMBAHKAN_SUPPLIER);
        },
      ),
    );
  }
}