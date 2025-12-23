import 'package:aplikasiinventorytokopulaubaru/app/controllers/TesController.dart';
import 'package:get/get.dart';

class TesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>TesController());
  }

}