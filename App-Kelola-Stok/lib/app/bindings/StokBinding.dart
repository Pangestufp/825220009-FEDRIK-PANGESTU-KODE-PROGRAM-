import 'package:aplikasiinventorytokopulaubaru/app/controllers/StokController.dart';
import 'package:get/get.dart';

class StokBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>StokController());
  }

}