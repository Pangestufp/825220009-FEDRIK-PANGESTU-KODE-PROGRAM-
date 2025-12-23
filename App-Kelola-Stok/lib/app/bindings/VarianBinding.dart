import 'package:aplikasiinventorytokopulaubaru/app/controllers/VarianController.dart';
import 'package:get/get.dart';

class VarianBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>VarianController());
  }

}