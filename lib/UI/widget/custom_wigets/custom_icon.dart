import 'package:flutter/material.dart';

customIcon(
    {required bool click,
    Function()? onTap,
    IconData? icon,
    Color? iconColor,
    double? iconSize}) {
  return InkWell(
    onTap: click ? onTap : () => {},
    child: Icon(
      icon,
      color: iconColor,
      size: iconSize,
    ),
  );
}
