import 'package:aplikasiinventorytokopulaubaru/app/controllers/SubKategoriController.dart';
import 'package:get/get.dart';

class SubKategoriBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SubKategoriController());
  }

}