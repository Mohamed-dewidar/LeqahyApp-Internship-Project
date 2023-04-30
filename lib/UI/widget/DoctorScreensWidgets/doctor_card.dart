import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/main.dart';
import 'package:leqahy/viewmodel/doctor_screen_viewmode/doctor_screen_viewmodel.dart';

doctorCard(
    {required String drName,
    required String drImage,
    required String speciality,
    required String fees,
    required dynamic size,
    required Function() onTap}) {
  DoctorScreenViewModel _vm = DoctorScreenViewModel();
  return Container(
    height: size.height * 0.15,
    margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.1, vertical: size.height * 0.01),
    decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              blurRadius: size.width * 0.03,
              color: darkBlueColor,
              blurStyle: BlurStyle.outer)
        ]),
    child: Column(children: [
      //Dr name & Dr image
      Row(
        children: [
          //Dr name & speciality
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(
                    text: drName,
                    fontSize: size.width * 0.05,
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold),
                CustomText(
                    text: speciality,
                    color: darkBlueColor,
                    fontSize: size.width * 0.03)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.015, right: size.width * 0.015),
            child: CircleAvatar(
              backgroundColor: whiteColor,
              backgroundImage: AssetImage(_vm.image),
              radius: size.width * 0.08,
              child: CircleAvatar(
                backgroundColor: whiteColor,
                radius: size.width * 0.05,
                child: Image.network('$MediaUrl/$drImage'),
              ),
            ),
          )
        ],
      ),

      Divider(
        indent: size.width * 0.1,
        endIndent: size.width * 0.1,
        thickness: size.height * 0.003,
        height: size.height * 0.02,
      ),

      //fees & book now
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: CustomText(
                    text: 'fees: $fees',
                    color: darkBlueColor,
                    fontSize: size.width * 0.04)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: Icon(
                    _vm.actionsIcon2,
                    color: darkBlueColor,
                    size: size.width * 0.04,
                  ),
                ),
                InkWell(
                    onTap: onTap,
                    child: CustomText(
                        text: 'Book Now',
                        color: darkBlueColor,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w900))
              ],
            )
          ],
        ),
      )
    ]),
  );
}
