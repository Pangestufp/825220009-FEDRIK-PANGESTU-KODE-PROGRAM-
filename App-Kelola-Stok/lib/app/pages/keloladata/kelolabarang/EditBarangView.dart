import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBarangView extends GetView<BarangController> {
  const EditBarangView({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
        controller.setFormData(Get.arguments);
    });

    return Scaffold(
        appBar: Styles.bar("EDIT BARANG"),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.deskripsiController,
                    decoration: Styles.underlineInput("Deskripsi"),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) =>
                    value == null || value.isEmpty ? "Deskripsi" : null,
                  ),
                  SizedBox(height: 16,),
                  Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedid_brand.value,
                      decoration: Styles.dropdownDecoration("Brand"),
                      items: controller.brandEditList.map<DropdownMenuItem<int>>((satuan) {
                        return DropdownMenuItem<int>(
                          value: satuan['id_brand'],
                          child: Text(satuan['namabrand']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedid_brand.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Brand wajib dipilih" : null,
                    ),
                  ),
                  SizedBox(height: 16,),
                                    Obx(
                        () => DropdownButtonFormField<int>(
                      value: controller.selectedid_varian.value,
                      decoration: Styles.dropdownDecoration("Varian"),
                      items: controller.varianEditList.map<DropdownMenuItem<int>>((ukuran) {
                        return DropdownMenuItem<int>(
                          value: ukuran['id_varian'],
                          child: Text("${ukuran['namasubkategori']} ${ukuran['ukuran']} ${ukuran['namasatuan']}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.selectedid_varian.value = val;
                      },
                      validator: (value) =>
                      value == null ? "Satuan wajib dipilih" : null,
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    final imageFile = controller.selectedImage2.value;
                    final imageUrl  = controller.existingImageUrl;
                    print(imageUrl);
                    return GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: imageFile != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                            : (imageUrl != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        )
                            : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add_a_photo, color: Colors.grey, size: 40),
                              SizedBox(height: 8),
                              Text("Pilih Gambar", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        bottomNavigationBar:
        Padding(padding: EdgeInsets.all(20),
          child: Obx(
                () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.isUpdating.value
                  ? null
                  : () {
                if (_formKey.currentState?.validate() ?? false) {
                  controller.editbarang();
                }
              },
              child: controller.isUpdating.value
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("Menyimpan..."),
                ],
              )
                  : Text("Edit"),
            ),
          ),
        )
    );
  }
}