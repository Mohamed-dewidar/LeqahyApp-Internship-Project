import 'package:flutter/cupertino.dart';

customLogo(
    {required double width,
    required double height,
    required String image,
    bool? network}) {
  if (network == null) network = false;
  return Container(
    height: height,
    width: width,
    child: network ? Image.network(image) : Image.asset(image),
  );
}
