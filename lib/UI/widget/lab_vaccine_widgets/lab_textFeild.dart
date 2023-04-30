import 'package:flutter/material.dart';
import 'package:leqahy/viewmodel/lab_vaccine_screen_viewmodel/lab_vaccine_screen_viewmodel.dart';

import '../custom_wigets/custom_text.dart';
import '../custom_wigets/custom_text_field.dart';

labVaccineTextFeild(
    {required dynamic size,
    required String mainText,
    required String hintText,
    required TextEditingController controller}) {
  LabVaccineScreenViewModel _vm = LabVaccineScreenViewModel();
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.1, vertical: size.height * 0.01),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.01),
            child: CustomText(
                text: mainText,
                color: Colors.grey[600],
                fontSize: size.width * 0.05)),
        Container(
            height: size.height * 0.05,
            child: CustomTextFeild(
                radius: 10,
                size: size,
                hintText: hintText,
                controller: controller))
      ],
    ),
  );
}
