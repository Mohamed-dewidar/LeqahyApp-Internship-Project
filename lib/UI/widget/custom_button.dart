import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';

customButton(
    {required dynamic size,
    String? text,
    Color? textColor,
    double? textSize,
    required BuildContext context,
    required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: size.width * 0.9,
      height: size.height * 0.06,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: darkBlueColor,
      ),
      child: Text(
        text!,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    ),
  );
}
