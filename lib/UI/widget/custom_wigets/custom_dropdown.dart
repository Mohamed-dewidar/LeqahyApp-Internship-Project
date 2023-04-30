import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';

customDropDownButton(
    {dynamic size,
    required String value,
    required List<String> items,
    required Function(dynamic) onChanged,
    String? text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Governorate text
      CustomText(text: text!),

      //Sized box
      SizedBox(
        height: size.height * 0.02,
      ),
      DropdownButton(
        hint: Text(text),
        dropdownColor: Colors.lightBlue[50],
        selectedItemBuilder: (context) => items.map((e) => Text(e)).toList(),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
            .toList(),
        onChanged: onChanged,
        value: value == '' ? text : value,
        isExpanded: true,
      ),
    ],
  );
}
