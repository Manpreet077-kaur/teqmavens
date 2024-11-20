import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widgets/loader.dart';


class UIData {
  static hideProgressDialog() {
    if(Get.isDialogOpen!) return Get.back();
  }

  static hideProgressSnack() {
    return Get.back();
  }

  static showProgressDialog() {
    Get.dialog(barrierDismissible: false,
      CustomLoader(),
    );
  }


  static Widget imageView(
      {required String image, double? width, double? height, Color? color}) {
    return Image.asset(
      "assets/images/$image",
      width: width,
      height: height,
      color: color,
    );
  }
  static Future<void> showLocationPermissionDialog() async {
    return Get.dialog(WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CupertinoAlertDialog(
        title: Text('Location Permission Required'),
        content: Text(
            'Please grant the app permission to access your location.'),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              await openAppSettings();
            },
            child: Text('Allow'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Don\'t Allow'),
          )
        ],
      ),
    ));
  }

}


