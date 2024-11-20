

import 'package:flutter/material.dart';

import 'app_color.dart';

getPdFrAll(double padAll){
  return EdgeInsets.all(padAll);
}
getPdFrHor({double padHor=0.0}){
  return EdgeInsets.symmetric(horizontal: padHor);
}
BoxDecoration boxDecoration= BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: AppColors.whiteColorG,


);