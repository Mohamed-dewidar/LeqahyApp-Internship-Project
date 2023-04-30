import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';

daysWidget(
    {required int dayNumber,
    required String dayName,
    required dynamic size,
    required bool select,
    required Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      width: size.width * 0.15,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.02),
      decoration: BoxDecoration(
          color: select ? darkBlueColor : greyColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        CustomText(
            text: '$dayNumber',
            color: select ? whiteColor : darkBlueColor,
            fontSize: size.width * 0.08),
        CustomText(
            text: dayName,
            color: select ? whiteColor : darkBlueColor,
            fontSize: size.width * 0.03),
      ]),
    ),
  );
}
