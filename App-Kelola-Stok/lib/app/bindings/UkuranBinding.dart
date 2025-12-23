import 'package:aplikasiinventorytokopulaubaru/app/controllers/UkuranController.dart';
import 'package:get/get.dart';

class UkuranBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UkuranController());
  }

}