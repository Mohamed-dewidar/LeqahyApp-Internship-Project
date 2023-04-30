import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/home_widget/icon_stack.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/viewmodel/cart_screen_viewmodel/cart_screen_viewmodel.dart';

cartProductWidget(
    {required dynamic size,
    Function()? onTapTrash,
    required String productName,
    required String avatarimage,
    required String pirce,
    required int quantity,
    required Function() onTapPlus,
    required Function() onTapMinus}) {
  CartScreenViewModel _vm = CartScreenViewModel();
  return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.035, vertical: size.height * 0.01),
      height: size.height * 0.2,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: greyColor,
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.white, whiteColor, darkBlueColor]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: darkBlueColor,
                blurRadius: 10,
                blurStyle: BlurStyle.outer)
          ]),
      child: Column(
        children: [
          //company logo & name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.02),
                          child: CustomText(
                              text: productName,
                              fontSize: size.width * 0.05,
                              color: darkBlueColor,
                              fontWeight: FontWeight.bold)),
                      CustomText(
                        text: 'Price : $pirce',
                        fontSize: size.width * 0.04,
                        color: darkBlueColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.015,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(_vm.image),
                    backgroundColor: whiteColor,
                    radius: 35,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      backgroundImage: NetworkImage('$avatarimage'),
                      maxRadius: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: size.height * 0.002,
            color: Colors.grey[600],
            indent: size.width * 0.05,
            endIndent: size.width * 0.05,
            height: size.height * 0.04,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: size.width * 0.1),
                  child: customIcon(
                      click: true,
                      icon: _vm.trashicon,
                      iconColor: Colors.red[500],
                      iconSize: size.width * 0.05,
                      onTap: onTapTrash)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: size.width * 0.05),
                      padding: EdgeInsets.all(size.width * 0.008),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: darkBlueColor,
                      ),
                      child: customIcon(
                        click: true,
                        icon: _vm.minus,
                        iconColor: whiteColor,
                        iconSize: size.width * 0.05,
                        onTap: onTapMinus,
                      )),
                  CustomText(
                      text: quantity.toString(),
                      color: Colors.black,
                      fontSize: size.width * 0.05),
                  Container(
                      margin: EdgeInsets.only(left: size.width * 0.05),
                      padding: EdgeInsets.all(size.width * 0.008),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: darkBlueColor,
                      ),
                      child: customIcon(
                          click: true,
                          icon: _vm.plus,
                          iconColor: whiteColor,
                          iconSize: size.width * 0.05,
                          onTap: onTapPlus)),
                ],
              )
            ],
          )
        ],
      ));
}
