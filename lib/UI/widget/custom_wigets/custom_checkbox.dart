import 'package:flutter/material.dart';

customCheckbox({bool? value, Function(bool?)? onChanged}) {
  return Checkbox(value: value, onChanged: onChanged);
}
