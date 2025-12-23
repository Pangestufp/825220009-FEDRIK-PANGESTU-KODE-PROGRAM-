import 'dart:io';

import 'package:aplikasiinventorytokopulaubaru/app/services/BarangService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/BrandService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/SubKategoriService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/UkuranService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/VarianService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/endpoints/EndPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BarangController extends GetxController {
  final BarangService _barangService = BarangService();
  final VarianService _varianService = VarianService();
  final BrandService _brandService = BrandService();
  var isUpdating = false.obs;
  String? existingImageUrl;

  var selecteddetail = 0.obs;

  var selectedid_barang = Rxn<int>();
  var selectedid_varian = Rxn<int>();
  var selectedid_brand = Rxn<int>();

  var barangList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var varianList = <dynamic>[].obs;
  var brandList = <dynamic>[].obs;
  var varianEditList = <dynamic>[].obs;
  var brandEditList = <dynamic>[].obs;

  var barangDetail = Rxn<Map<String, dynamic>>();

  final ImagePicker _picker = ImagePicker();
  var selectedImage2 = Rxn<File>();

  File? selectedImage;

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage2.value = File(picked.path);
      selectedImage = File(picked.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchbarang();
  }

  Future<void> fetchbarang() async {
    try {
      isLoading.value = true;
      final barangs = await _barangService.getAllBarang();
      barangList.assignAll(barangs);
      filteredList.assignAll(barangs);

      final varians = await _varianService.getAllVarian();
      varianList.assignAll(varians) ;
      varianEditList.assignAll(varians);


      final brands = await _brandService.getAllbrand();
      brandList.assignAll(brands);
      brandEditList.assignAll(brands);

    } finally {
      isLoading.value = false;
    }
  }

  void searchBarang(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(barangList);
    } else {
      filteredList.assignAll(
        barangList.where((u) {
          final data = "${u['namatext']}${u['namakategori']}${u['deskripsi']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchBarangById(int id) async {
    try {
      isLoading.value = true;
      final barang = await _barangService.getBarangById(id);
      barangDetail.value = barang;

      if(barang!=null){
        final id_varian = barang['id_varian'];
        final namakategori = barang['namakategori'];
        final id_subkategori = barang['id_subkategori'];
        final namasubkategori = barang['namasubkategori'];
        final id_ukuran = barang['id_ukuran'];
        final ukuran = barang['ukuran'];
        final namasatuan = barang['namasatuan'];

        final sudahAda = varianList.any((data) => data['id_varian'] == id_varian);

        if (!sudahAda) {
          varianEditList.add({
            'id_varian': id_varian,
            'namakategori': namakategori ?? 'Tidak diketahui',
            'id_subkategori': id_subkategori,
            'namasubkategori': namasubkategori ?? 'Tidak diketahui',
            'id_ukuran': id_ukuran,
            'ukuran': ukuran ?? 'Tidak diketahui',
            'namasatuan': namasatuan ?? 'Tidak diketahui',
          });
        }else{
          varianEditList.assignAll(varianList);
        }

        final id_brand = barang['id_brand'];
        final namabrand = barang['namabrand'];

        final sudahAda1 = brandList.any((data) => data['id_brand'] == id_brand);

        if (!sudahAda1) {
          brandEditList.add({
            'id_brand': id_brand,
            'namabrand': namabrand ?? 'Tidak diketahui',
          });
        }else{
          brandEditList.assignAll(brandList);
        }



      }



    } finally {
      isLoading.value = false;
    }
  }


  void deleteBarang(int id) async {
    try {
      isLoading.value = true;
      final result = await _barangService.updateStatusBarang(id);

      if (result != null && result is Map<String, dynamic>) {
        final message = result['message'] ?? "Barang berhasil dihapus";
        await fetchbarang();
        Get.back();
        Get.snackbar(
          "Notifikasi",
          message,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghapus Barang",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  final deskripsiController = TextEditingController();
  final stokController = TextEditingController();

  Future<void> tambahBarang() async {
    isUpdating.value = true;
    final body = {
      "deskripsi": deskripsiController.text,
      "stok": 0,
      "id_brand": selectedid_brand.value,
      "id_varian": selectedid_varian.value,
    };

    try {
      final result = await _barangService.tambahBarang(
        body,
        file: selectedImage,
      );

      if (result != null && result is Map<String, dynamic>) {
        await fetchbarang();
        deskripsiController.clear();
        stokController.clear();
        selectedImage = null;
        final message = result['message'] ?? "Barang berhasil ditambahkan";
        Get.back();
        Get.snackbar("Notifikasi", message, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Gagal menambahkan Barang",
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isUpdating.value = false;
    }
  }

  Future<void> editbarang() async {
    int? id=selectedid_barang.value;

    isUpdating.value = true;
    final body = {
      "deskripsi": deskripsiController.text,
      "id_brand": selectedid_brand.value,
      "id_varian": selectedid_varian.value,
    };

    if(id!=null) {
      print(id);
      try {
        final result = await _barangService.updateBarang(
          body,
          id,
          file: selectedImage,
        );

        if (result != null && result is Map<String, dynamic>) {

          deskripsiController.clear();
          stokController.clear();
          selectedImage = null;
          String message = result['message'] ?? "Barang berhasil diupdate";

          if(message=='Format'){
            message = "Format gambar yang didukung (JPG, JPEG, PNG, GIF)";
          }else if(message=='Ukuran'){
            message = "Ukuran gambar lebih dari 2MB";
          }else {
            Get.back(result: id);
            await fetchBarangById(id);
            await fetchbarang();
          }
          Get.snackbar(
              "Notifikasi", message, snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Gagal mengubah Barang",
              snackPosition: SnackPosition.BOTTOM);
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }

  void clean(){
    deskripsiController.clear();
    stokController.clear();
  }

  void setFormData(Map<String, dynamic> data) {
    print(data);
    selectedid_barang.value = data['id_barang'] ?? "";
    deskripsiController.text = data['deskripsi'] ?? "";
    selectedid_brand.value  = data['id_brand'] ?? "";
    print("${selectedid_barang.value}");
    selectedid_varian.value = data['id_varian'] ?? "";
    existingImageUrl = "${EndPoints.imageUrl}${data['imagepath']}";
    print(existingImageUrl);
    selectedImage = null;
    selectedImage2.value=null;
  }
}