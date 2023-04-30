import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/lab_vaccine_models/lab_vaccine.dart';

class LabVaccineScreenViewModel {
  //AppBar
  //Leading
  IconData leadingIcon1 = FontAwesomeIcons.arrowLeft;
  IconData leadingIcon2 = FontAwesomeIcons.list;
  //Title
  String leqahyText = 'Leqahy';
  String leqahyLogoPath = 'assets/images/leqahy_logo.jpeg';
  //Actions
  IconData basketIcon = FontAwesomeIcons.cartShopping;

  //Data
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController labController = TextEditingController();
  TextEditingController numController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  IconData dateicon = FontAwesomeIcons.calendar;

  TextEditingController reservationController = TextEditingController();

  //DropDown Category

  IconData dropDownArrowDown = FontAwesomeIcons.angleDown;
  IconData dropDownArrowUp = FontAwesomeIcons.angleUp;

  static Map<String, bool> ExapandView = {};
  static Map<String, bool> selectMap = {};
  static Set<dynamic> LabProducts = {};

  setExpandView(Map<String, bool> map) {
    ExapandView = map;
  }

  setLapProducts(Set<dynamic> set) {
    LabProducts = set;
  }
}
