import 'package:aplikasiinventorytokopulaubaru/app/controllers/MenuUtamaController.dart';
import 'package:get/get.dart';

class MenuUtamaBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MenuUtamaController());
  }

}