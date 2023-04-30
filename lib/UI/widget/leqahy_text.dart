import 'package:flutter/material.dart';
import 'package:leqahy/constant/colors.dart';

class LeqahyText extends StatelessWidget {
  const LeqahyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
          color: darkBlueColor, fontWeight: FontWeight.bold, fontSize: 40),
      child: Text('Leqahy'),
    );
  }
}
