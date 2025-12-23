import 'package:aplikasiinventorytokopulaubaru/app/controllers/SupplierController.dart';
import 'package:get/get.dart';

class SupplierBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SupplierController());
  }

}