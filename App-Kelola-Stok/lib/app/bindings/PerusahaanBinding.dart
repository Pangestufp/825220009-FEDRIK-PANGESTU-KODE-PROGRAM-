import 'package:aplikasiinventorytokopulaubaru/app/controllers/PerusahaanController.dart';
import 'package:get/get.dart';

class PerusahaanBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PerusahaanController());
  }

}