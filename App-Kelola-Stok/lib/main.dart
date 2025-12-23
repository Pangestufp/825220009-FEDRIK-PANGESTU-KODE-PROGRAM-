import 'package:aplikasiinventorytokopulaubaru/app/services/TokenService.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/AppPages.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenService = TokenService();
  final token = await tokenService.getToken();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token != null ? Routes.MENU_UTAMA : Routes.MENU_LOGIN,
      getPages: AppPages.routes,
    ),
  );
}