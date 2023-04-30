import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import 'custom_text_field.dart';

customSearchBar({required dynamic size, required IconData prefixIcon}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1, vertical: size.height * 0.02),
    child: Container(
        height: size.height * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: darkBlueColor,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 10),
            ]),
        child: CustomTextFeild(
            size: size,
            hintText: 'search'.tr(),
            radius: 20,
            prefixIcon: Icon(
              prefixIcon,
              color: darkBlueColor,
            ))),
  );
}
