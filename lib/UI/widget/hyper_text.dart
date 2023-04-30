import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

HyperText(String? text) {
  return InkWell(
    onTap: () => print('object'),
    child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(color: darkBlueColor, fontSize: 15),
          text: text,
        )),
  );
}
