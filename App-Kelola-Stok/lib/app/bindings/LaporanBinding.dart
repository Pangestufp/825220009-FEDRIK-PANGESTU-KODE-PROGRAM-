import 'package:aplikasiinventorytokopulaubaru/app/controllers/LaporanController.dart';
import 'package:get/get.dart';

class LaporanBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LaporanController());
  }

}