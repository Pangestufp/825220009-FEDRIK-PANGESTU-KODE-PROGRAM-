import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangKeluarController.dart';
import 'package:aplikasiinventorytokopulaubaru/app/controllers/BarangMasukController.dart';
import 'package:get/get.dart';

class BarangMasukBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BarangMasukController());
  }

}