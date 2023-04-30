import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';

category(
    {Function()? onMeatTap,
    required Function() onTapTwo,
    required Function() onTapThree,
    required Function() onTapFour}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      InkWell(
        onTap: onMeatTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/meat.png'),
            CustomText(text: 'Meat', color: darkBlueColor)
          ],
        ),
      ),
      InkWell(
        onTap: onTapTwo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/egg.png'),
            CustomText(text: 'Eggs', color: darkBlueColor)
          ],
        ),
      ),
      InkWell(
        onTap: onTapThree,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/food.png'),
            CustomText(text: 'Food', color: darkBlueColor)
          ],
        ),
      ),
      InkWell(
        onTap: onTapFour,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/chicken.png'),
            CustomText(text: 'Chickens', color: darkBlueColor)
          ],
        ),
      ),
    ],
  );
}
