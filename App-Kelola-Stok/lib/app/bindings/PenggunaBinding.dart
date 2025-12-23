import 'package:aplikasiinventorytokopulaubaru/app/controllers/PenggunaController.dart';
import 'package:get/get.dart';

class PenggunaBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PenggunaController());
  }

}