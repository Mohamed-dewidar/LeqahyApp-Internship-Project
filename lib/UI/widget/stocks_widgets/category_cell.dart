import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';

categoryCell(
    {String? companyName,
    String? product,
    String? price,
    String? unit,
    required dynamic size}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shadowColor: darkBlueColor,
      elevation: 1,
      color: Colors.blue[50]!.withOpacity(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: size.width * 0.20,
              child:
                  CustomText(text: companyName!, fontSize: size.width * 0.04)),
          SizedBox(
              width: size.width * 0.20,
              child: CustomText(text: product!, fontSize: size.width * 0.04)),
          SizedBox(
              width: size.width * 0.20,
              child: CustomText(text: price!, fontSize: size.width * 0.04)),
          SizedBox(
              width: size.width * 0.20,
              child: CustomText(text: unit!, fontSize: size.width * 0.04)),
        ],
      ),
    ),
  );
}
