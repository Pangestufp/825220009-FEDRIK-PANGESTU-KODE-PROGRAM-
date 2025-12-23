import 'package:aplikasiinventorytokopulaubaru/app/services/SubKategoriService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/UkuranService.dart';
import 'package:aplikasiinventorytokopulaubaru/app/services/VarianService.dart';
import 'package:get/get.dart';

class VarianController extends GetxController{
  final SubKategoriService _subKategoriService = SubKategoriService();
  final UkuranService _ukuranService = UkuranService();
  final VarianService _varianService = VarianService();
  var isUpdating = false.obs;

  var selecteddetail = 0.obs;

  var selectedid_subkategori = Rxn<int>();
  var selectedid_ukuran = Rxn<int>();

  var varianList = <dynamic>[].obs;
  var filteredList = <dynamic>[].obs;
  var isLoading = false.obs;

  var subkategoriList = <dynamic>[].obs;
  var ukuranList = <dynamic>[].obs;
  var subkategoriEditList = <dynamic>[].obs;
  var ukuranEditList = <dynamic>[].obs;

  var varianDetail = Rxn<Map<String, dynamic>>();



  @override
  void onInit() {
    super.onInit();
    fetchbarang();
  }

  Future<void> fetchbarang() async {
    try {
      isLoading.value = true;
      final varians = await _varianService.getAllVarian();
      varianList.assignAll(varians);
      filteredList.assignAll(varians);

      final subkategoris = await _subKategoriService.getAllSubKategori();
      subkategoriList.assignAll(subkategoris) ;
      subkategoriEditList.assignAll(subkategoris);

      final ukurans = await _ukuranService.getAllUkuran();
      ukuranList.assignAll(ukurans);
      ukuranEditList.assignAll(ukurans);

    } finally {
      isLoading.value = false;
    }
  }

  void searchBarang(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(varianList);
    } else {
      filteredList.assignAll(
        varianList.where((u) {
          final data = "${u['namasatuan']}${u['namakategori']}${u['namasubkategori']}${u['ukuran']}".toLowerCase();
          return data.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  Future<void> fetchVarianById(int id) async {
    try {
      isLoading.value = true;
      final varian = await _varianService.getVarianById(id);
      varianDetail.value = varian;

      if(varian!=null){
        final id_kategori = varian['id_kategori'];
        final namakategori = varian['namakategori'];
        final id_subkategori = varian['id_subkategori'];
        final namasubkategori = varian['namasubkategori'];

        final sudahAda = subkategoriList.any((data) => data['id_subkategori'] == id_subkategori);

        if (!sudahAda) {
          subkategoriEditList.add({
            'id_kategori': id_kategori,
            'namakategori': namakategori ?? 'Tidak diketahui',
            'id_subkategori': id_subkategori,
            'namasubkategori': namasubkategori ?? 'Tidak diketahui',
          });
        }else{
          subkategoriEditList.assignAll(subkategoriList);
        }

        final id_ukuran = varian['id_ukuran'];
        final ukuran = varian['ukuran'];
        final id_satuan = varian['id_satuan'];
        final namasatuan = varian['namasatuan'];

        final sudahAda1 = ukuranList.any((data) => data['id_ukuran'] == id_ukuran);

        if (!sudahAda1) {
          ukuranEditList.add({
            'id_ukuran': id_ukuran,
            'ukuran': ukuran ?? 'Tidak diketahui',
            'id_satuan': id_satuan,
            'namasatuan': namasatuan ?? 'Tidak diketahui',
          });
        }else{
          ukuranEditList.assignAll(ukuranList);
        }

      }


    } finally {
      isLoading.value = false;
    }
  }


  void deleteVarian(int id) async {
    try {
      isLoading.value = true;
      final result = await _varianService.updateStatusVarian(id);

      if (result != null && result is Map<String, dynamic>) {
        final message = result['message'] ?? "Varian berhasil dihapus";
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
          "Gagal menghapus Varian",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> tambahVarian() async {
    isUpdating.value = true;
    final body = {
      "id_subkategori": selectedid_subkategori.value,
      "id_ukuran": selectedid_ukuran.value,
    };

    try {
      final result = await _varianService.tambahVarian(
        body,
      );

      if (result != null && result is Map<String, dynamic>) {
        await fetchbarang();
        final message = result['message'] ?? "Varian berhasil ditambahkan";
        Get.back();
        Get.snackbar("Notifikasi", message, snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Gagal menambahkan Varian",
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isUpdating.value = false;
    }
  }

  Future<void> editbarang() async {
    int? id=selecteddetail.value;

    isUpdating.value = true;
    final body = {
      "id_subkategori": selectedid_subkategori.value,
      "id_ukuran": selectedid_ukuran.value,
    };

    if(id!=null) {
      print(id);
      try {
        final result = await _varianService.updateVarian(
          body,
          id,
        );

        if (result != null && result is Map<String, dynamic>) {
          final message = result['message'] ?? "Varian berhasil diupdate";
          Get.back(result: id);
          await fetchbarang();
          await fetchVarianById(id);
          Get.snackbar(
              "Notifikasi", message, snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Gagal mengubah Varian",
              snackPosition: SnackPosition.BOTTOM);
        }
      } finally {
        isUpdating.value = false;
      }
    }
  }


  void setFormData(Map<String, dynamic> data) {
    selectedid_subkategori.value = data['id_subkategori'] ?? "";
    selectedid_ukuran.value = data['id_ukuran'] ?? "";

  }
}