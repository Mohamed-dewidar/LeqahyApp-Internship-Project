import 'package:flutter/material.dart';

customDatePicker(
    {required BuildContext context,
    required DateTime initialDate,
    required DateTime currentDate}) {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(DateTime.now().year),
    lastDate: DateTime(DateTime.now().year + 20),
    currentDate: currentDate,
    initialEntryMode: DatePickerEntryMode.input,
    textDirection: TextDirection.ltr,
    initialDatePickerMode: DatePickerMode.day,
  );
}
