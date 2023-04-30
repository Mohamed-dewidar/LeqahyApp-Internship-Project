import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';

orderBarWidget(
    {required dynamic size,
    required String image1,
    required String text1,
    required String image2,
    required String text2,
    required String image3,
    required String text3,
    required int phaseId}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Column(children: [
      Image.asset(
        image1,
        color: darkGreyColor,
      ),
      CustomText(
          text: text1,
          color: darkBlueColor,
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold),
      Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        color: phaseId == 1 ? darkBlueColor : whiteColor,
        width: size.width * 0.2,
        height: size.height * 0.005,
      )
    ]),
    Column(children: [
      Image.asset(
        image2,
        color: darkGreyColor,
      ),
      CustomText(
          text: text2,
          color: darkBlueColor,
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold),
      Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        color: phaseId == 2 ? darkBlueColor : whiteColor,
        width: size.width * 0.2,
        height: size.height * 0.005,
      )
    ]),
    Column(children: [
      Image.asset(
        image3,
        color: darkGreyColor,
      ),
      CustomText(
          text: text3,
          color: darkBlueColor,
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold),
      Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        color: phaseId == 3 ? darkBlueColor : whiteColor,
        width: size.width * 0.2,
        height: size.height * 0.005,
      )
    ])
  ]);
}
