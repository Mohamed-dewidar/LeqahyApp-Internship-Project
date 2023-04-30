import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';

customAppBar(
    {Color? backgrondcolor,
    required bool prefix,
    Function()? onPressed,
    IconData? preIcon,
    Color? preIconColor,
    required Widget title,
    required bool posfix,
    Widget? posfixIcon}) {
  return AppBar(
    bottomOpacity: 20,
    backgroundColor: backgrondcolor,
    elevation: 0.0,
    leading: prefix
        ? IconButton(
            onPressed: onPressed,
            icon: Icon(
              preIcon,
              color: preIconColor,
            ))
        : Container(),
    title: title,
    centerTitle: true,
    shadowColor: backgroundColor,
    actions: posfix ? [posfixIcon!] : [Container()],
  );
}
