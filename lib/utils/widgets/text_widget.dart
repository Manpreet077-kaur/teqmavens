import 'package:flutter/material.dart';
import 'package:teqmavens_task/helper/app_color.dart';


class TextWidget extends Text {
  String text;
  TextOverflow? textOverflow;
  int? maxLine;
  double? height;
  double? letterSpacing;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  Color? color;
  TextAlign? textAlign;

  TextWidget(this.text,
      {Key? key,
      this.textOverflow,
      this.maxLine,
      this.fontWeight=FontWeight.normal,
      this.fontSize,
      this.fontFamily,
      this.height,
      this.color=AppColors.blackColor,
      this.textAlign,
      this.letterSpacing})
      : super(text,
            key: key,
            overflow: textOverflow,
            maxLines: maxLine,
            textAlign: textAlign,
            style: TextStyle(
                height: height,
                letterSpacing: letterSpacing,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontFamily: fontFamily,
                color: color));
}
