import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text_field.dart';
import 'package:leqahy/constant/colors.dart';

customCode(
    {required dynamic size,
    required String code,
    required Function() onPressed}) {
  return Card(
      color: darkBlueColor,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: whiteColor),
                    child: CustomTextFeild(size: size, hintText: 'Code')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: onPressed,
                    child:
                        CustomText(text: 'Apply', fontWeight: FontWeight.bold)),
              )
            ],
          )));
}
