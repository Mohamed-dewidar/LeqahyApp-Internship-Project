import 'package:flutter/material.dart';

CustomPassword(
    {required bool obsecureText,
    required Function toggle,
    required TextEditingController passwordController}) {
  return TextField(
    controller: passwordController,
    decoration: InputDecoration(
      hintText: 'Password',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: InkWell(
        onTap: (() {
          toggle();
        }),
        child: Icon(
          obsecureText ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    ),
    obscureText: obsecureText,
  );
}
