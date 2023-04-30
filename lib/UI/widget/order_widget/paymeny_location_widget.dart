import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';

paymentLocationWidget(
    {required bool value1,
    required bool value2,
    required Function(bool?) onChanged1,
    required Function(bool?) onChanged2,
    required String text1,
    required String text2,
    required dynamic size}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: greyColor),
    width: size.width * 0.9,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
          ),
          height: size.height * 0.07,
          margin: EdgeInsets.symmetric(
              vertical: size.height * 0.01, horizontal: size.width * 0.02),
          child: Center(
            child: CheckboxListTile(
              value: value1,
              checkboxShape: StadiumBorder(side: BorderSide.none),
              contentPadding: EdgeInsets.all(size.width * 0.01),
              dense: true,
              activeColor: darkBlueColor,
              onChanged: value1 == false ? onChanged1 : (value) {},
              checkColor: darkBlueColor,
              title: Center(
                  child: Text(
                text1,
                style: TextStyle(
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.03),
              )),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
          ),
          height: size.height * 0.07,
          margin: EdgeInsets.symmetric(
              vertical: size.height * 0.01, horizontal: size.width * 0.02),
          child: Center(
            child: CheckboxListTile(
              value: value2,
              checkboxShape: StadiumBorder(side: BorderSide.none),
              contentPadding: EdgeInsets.all(size.width * 0.01),
              dense: true,
              activeColor: darkBlueColor,
              onChanged: value2 == false ? onChanged2 : (value) {},
              checkColor: darkBlueColor,
              title: Center(
                  child: Text(
                text2,
                style: TextStyle(
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.03),
              )),
            ),
          ),
        ),
      ],
    ),
  );
}
