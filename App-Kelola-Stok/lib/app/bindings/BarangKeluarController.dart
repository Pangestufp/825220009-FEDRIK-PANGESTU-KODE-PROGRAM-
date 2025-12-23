import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangKeluarController.dart';
import 'package:get/get.dart';

class BarangKeluarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BarangKeluarController());
  }

}