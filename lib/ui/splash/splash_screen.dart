import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teqmavens_task/helper/app_color.dart';

import '../../utils/utils.dart';
import 'splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:Center(
        child:  AnimatedAlign(
          alignment: controller.alignSplash,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: UIData.imageView(
           image:  'splash1.png',
            width: Get.width * 0.4,
          ),
        ),
      )
    );
  }
}

