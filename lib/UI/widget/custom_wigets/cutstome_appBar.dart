import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_logo.dart';
import 'package:leqahy/constant/colors.dart';

customAppBarNew(
    {required dynamic size,
    required Widget title,
    Widget? leading,
    Widget? actions}) {
  return Container(
    height: size.height * 0.08,
    width: size.width * 0.98,
    // decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     boxShadow: const [
    //       BoxShadow(
    //         blurRadius: 5,
    //         color: darkBlueColor,
    //         blurStyle: BlurStyle.outer,
    //       )
    //     ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Leading
        leading ?? Container(),
        //Title
        Expanded(child: title),
        //Actions
        actions ?? Container()
      ],
    ),
  );
}
