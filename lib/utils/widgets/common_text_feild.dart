import 'package:flutter/material.dart';
import 'package:teqmavens_task/helper/padding_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final InputBorder? border;

  const CustomTextField({
    Key? key,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.contentPadding,
    this.cursorColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: TextField(
        controller: controller,
        cursorColor: cursorColor,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          border: border ?? InputBorder.none,
          hintText: hintText,
          contentPadding: contentPadding,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
