import 'package:aplikasiinventorytokopulaubaru/app/controllers/TipeController.dart';
import 'package:get/get.dart';

class TipeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>TipeController());
  }

}