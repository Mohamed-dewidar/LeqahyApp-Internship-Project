import 'package:flutter/cupertino.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';

detailsCard(
    {required String title, required String data, required dynamic size}) {
  return Container(
    margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, horizontal: size.width * 0.04),
    color: whiteColor,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: title,
              color: darkBlueColor,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold),
          Container(
              alignment: AlignmentDirectional.centerStart,
              width: size.width * 0.92,
              height: size.height * 0.06,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: CustomText(
                  text: data,
                  color: darkBlueColor,
                  fontSize: size.width * 0.04))
        ]),
  );
}
