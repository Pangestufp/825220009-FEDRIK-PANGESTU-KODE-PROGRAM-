import 'package:aplikasiinventorytokopulaubaru/app/controllers/MenuUtamaController.dart';
import 'package:aplikasiinventorytokopulaubaru/shared/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends GetView<MenuUtamaController> {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles.bar("Error"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Error",style: TextStyle(color: Styles.primaryColor),),
            Text("Anda tidak memiliki akses", style: TextStyle(color: Styles.primaryColor),)
          ],
        ),
      ),
    );
  }
}
