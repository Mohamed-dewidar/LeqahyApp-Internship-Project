import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CustomText(
    {required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign}) {
  return Text(
    textAlign: textAlign,
    '$text',
    style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    maxLines: 1,
    softWrap: true,
    overflow: TextOverflow.visible,
  );
}
