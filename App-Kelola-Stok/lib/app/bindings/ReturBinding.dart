
import 'package:aplikasiinventorytokopulaubaru/app/controllers/ReturController.dart';
import 'package:get/get.dart';

class ReturBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ReturController());
  }

}