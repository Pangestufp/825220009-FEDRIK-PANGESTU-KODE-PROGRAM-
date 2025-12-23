import 'package:aplikasiinventorytokopulaubaru/app/controllers/BrandController.dart';
import 'package:get/get.dart';

class BrandBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BrandController());
  }

}