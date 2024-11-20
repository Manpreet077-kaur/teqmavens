import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teqmavens_task/routes/app_routes.dart';
class SplashController extends GetxController {
  Alignment alignSplash = Alignment.topLeft;
  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    alignSplash = Alignment.center;
  }
  @override
  void onInit() {
    super.onInit();
    _startAnimation();
    navigateToApplication();
  }
  navigateToApplication(){
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offNamed(AppRoutes.Home);
    });
  }
}
