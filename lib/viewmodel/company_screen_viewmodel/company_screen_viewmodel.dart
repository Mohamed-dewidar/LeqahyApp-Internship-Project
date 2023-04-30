import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leqahy/UI/widget/home_widget/icon_stack.dart';

class CompanyScreenViewModel {
  final String companyUrl =
      'https://leqahyapp.hypercare-eg.com/leqahy-app/api/v1/get-Companies-Info';
  // AppBar
  //Leading
  IconData leadingIcon1 = FontAwesomeIcons.arrowLeft;
  //title
  String leqahyLogoPath = 'assets/images/leqahy_logo.jpeg';
  String leqahyText = 'Leqahy';

  //Search Bar
  IconData searchPrefixIcon = FontAwesomeIcons.magnifyingGlass;

  //Grid
  String image = 'assets/images/logoMark.png';
}
