import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/legahy_logo.dart';
import 'package:leqahy/constant/colors.dart';

class StocksScreenViewModel {
  Color backgroundcolor = whiteColor;

  String url =
      'https://leqahyapp.hypercare-eg.com/leqahy-app/api/v1/get-main-oc_stockmarket';
  String? _meat;
  String? _egg;
  String? _food;
  String? _chicken;

  //Main AppBar
  IconData preIcon = Icons.list;
  IconData posIcon = Icons.notifications;
  Color preIconColor = Colors.black;
  Color posIconColor = Colors.black;
  double preIconSize = 30;
  double posIconSize = 30;
  Widget title = const LeqahyLogo();

  //Second AppBar
  IconData preIconSec = Icons.arrow_back_ios;
  Color preIconSecColor = Colors.black;
  Widget tileSec =
      CustomText(text: 'Leqahy Stocks', fontSize: 25, color: darkBlueColor);

  IconData posIconSec = Icons.calendar_month;
  Color posIconSecColor = Colors.black;
  double posIconSecSize = 30;

  //Bottom Nav Bar

  preIconOnPressed() {
    print('pop current page');
  }

  posIconOnPressed() {
    print('notificaon');
  }

  preIconSecOnPressed() {
    print('second icon');
  }

  // Category Functions

}
