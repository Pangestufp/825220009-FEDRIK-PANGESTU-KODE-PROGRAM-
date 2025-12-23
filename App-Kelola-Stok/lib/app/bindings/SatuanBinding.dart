import 'package:aplikasiinventorytokopulaubaru/app/controllers/SatuanController.dart';
import 'package:get/get.dart';

class SatuanBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SatuanController());
  }

}