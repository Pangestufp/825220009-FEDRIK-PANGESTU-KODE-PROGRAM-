import 'package:aplikasiinventorytokopulaubaru/app/controllers/ProfilTokoController.dart';
import 'package:get/get.dart';

class ProfilTokoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProfilTokoController());
  }

}