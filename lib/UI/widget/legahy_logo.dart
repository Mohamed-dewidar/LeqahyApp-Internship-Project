import 'package:flutter/material.dart';

class LeqahyLogo extends StatelessWidget {
  const LeqahyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.13,
      height: size.height * 0.07,
      child: Image.asset(
        'assets/images/leqahy_logo.jpeg',
      ),
    );
  }
}
