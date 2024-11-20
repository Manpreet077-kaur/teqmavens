import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarView{
 static  showSnackBar( {
    required String title,
    required String message,
    required bool? isError}){
 return  Get.snackbar(
     title,
     message,
     colorText: Colors.white,
   snackPosition: SnackPosition.BOTTOM,
   backgroundColor:isError==true? Colors.red.withOpacity(0.6): Colors.green.withOpacity(0.6),
     icon:isError==true?  const Icon(Icons.error_outline,color: Colors.red,):const Icon(Icons.check_circle_outline,color: Colors.green,),
   );
  }

}