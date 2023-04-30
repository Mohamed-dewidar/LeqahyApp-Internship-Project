import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/viewmodel/home_viewmodel/home_screen_viewmodel.dart';

class MyDrawer extends StatelessWidget {
  HomeScreenViewModel? home;
  MyDrawer({super.key, this.home});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
              title: CustomText(
                  text: 'عربى',
                  color: darkBlueColor,
                  fontSize: size.width * 0.05),
              onTap: () async {
                await home!.setLangAr(context);
                Navigator.pop(context);
              }),
          ListTile(
              title: CustomText(
                  text: 'English',
                  color: darkBlueColor,
                  fontSize: size.width * 0.05),
              onTap: () async {
                await home!.setLangEn(context);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
