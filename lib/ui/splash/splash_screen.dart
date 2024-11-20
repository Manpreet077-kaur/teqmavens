import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teqmavens_task/helper/app_color.dart';
import 'package:teqmavens_task/helper/string_constants.dart';
import 'package:teqmavens_task/utils/widgets/text_widget.dart';

import '../../utils/utils.dart';
import 'splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextWidget(StringConstants.weather, fontSize: 24.0,fontWeight: FontWeight.bold,),
             Center(
               child:  AnimatedAlign(
                 alignment: controller.alignSplash,
                 duration: const Duration(seconds: 1),
                 curve: Curves.easeInOut,
                 child: UIData.imageView(
                   image:  'splash1.png',
                   width: Get.width * 0.4,
                 ),
               ),
             ),
           ],
         )
        ],
      )
    );
  }
}

