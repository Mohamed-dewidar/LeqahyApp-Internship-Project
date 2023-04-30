import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';

CustomTextFeild(
    {String? hintText,
    IconData? icon,
    TextEditingController? controller,
    Widget? suffixIcon,
    Widget? prefixIcon,
    double? radius,
    required dynamic size,
    bool? readOnly,
    Color? hintColor}) {
  return TextField(
    controller: controller,
    readOnly: readOnly ?? false,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey, width: size.width * 0.005),
            borderRadius: BorderRadius.circular(radius ?? 12)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintColor ?? Colors.grey[500], fontSize: size.width * 0.04),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 12)),
        fillColor: darkBlueColor),
    style: TextStyle(
        color: Colors.blue[900],
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.w600),
  );
}
