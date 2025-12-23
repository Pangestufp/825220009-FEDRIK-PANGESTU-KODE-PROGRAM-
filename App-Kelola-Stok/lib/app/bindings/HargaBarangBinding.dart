import 'package:aplikasiinventorytokopulaubaru/app/controllers/HargaBarangController.dart';
import 'package:get/get.dart';

class HargaBarangBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HargaBarangController());
  }

}