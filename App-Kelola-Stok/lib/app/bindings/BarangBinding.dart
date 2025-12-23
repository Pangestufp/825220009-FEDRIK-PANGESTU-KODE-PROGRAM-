import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangController.dart';
import 'package:get/get.dart';

class BarangBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BarangController());
  }

}