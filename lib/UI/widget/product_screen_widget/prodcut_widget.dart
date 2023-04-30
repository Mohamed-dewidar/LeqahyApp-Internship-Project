import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/viewmodel/products_screen_viewmodel/prodcut_screen_viewmodel.dart';

ProductScreenViewModel _vm = ProductScreenViewModel();
productSample(
    {required dynamic size,
    required String image,
    required String disAmount,
    required String viewed,
    required String name,
    required String price,
    required Function() onTap,
    required Function() onTapDesc,
    required String check}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
        boxShadow: const [
          BoxShadow(
              color: darkBlueColor, blurStyle: BlurStyle.outer, blurRadius: 10)
        ]),
    //Main column
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //discount & views
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: size.height * 0.03,
              width: size.width * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: darkBlueColor),
              child: Text(
                '-$disAmount%',
                style: TextStyle(color: whiteColor),
              ),
            ),
            Container(
              height: size.height * 0.03,
              width: size.width * 0.15,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: greyColor),
              child: Text(
                'Views ($viewed)',
                softWrap: true,
                style: TextStyle(
                    color: darkBlueColor,
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),

        //Product Image
        InkWell(
          onTap: onTapDesc,
          child: Container(
              height: size.height * 0.15,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greyColor,
              ),
              child: customLogo(
                  width: size.width,
                  height: size.height,
                  image: image,
                  network: true)),
        ),
        //Product name
        Text(name,
            // overflow: TextOverflow.ellipsis,
            //softWrap: true,
            style: TextStyle(
              color: darkBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.04,
            )),

        //Pirce & Add
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$price LE',
                style: TextStyle(
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04)),
            customIcon(
                click: true,
                icon: check == "0" ? _vm.addProuct : _vm.checkicon,
                iconColor: darkBlueColor,
                onTap: check == "0" ? onTap : () {})
          ],
        )
      ],
    ),
  );
}
