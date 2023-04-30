import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/UI/screen/HomeScreen/home_screen.dart';
import 'package:leqahy/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leqahy/UI/screen/stocks_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_appbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';

import 'package:leqahy/UI/widget/hyper_text.dart';
import 'package:leqahy/UI/widget/legahy_logo.dart';
import 'package:leqahy/UI/widget/leqahy_text.dart';

import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/services/login%20services/login_service.dart';
import 'package:leqahy/viewmodel/login%20viewmodel/login_screen_viewmodel.dart';

import '../../../model/Login Models/login_model.dart';
import '../../widget/custom_wigets/custom_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routename = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText = true;
  LoginScreenViewModel _viewModel = LoginScreenViewModel();
  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),

              //Leqahy Logo
              const LeqahyLogo(),

              //Leqahy Text
              const LeqahyText(),

              //Sized Box
              SizedBox(
                height: size.height * 0.05,
              ),

              // Login Row
              customAppBar(
                  backgrondcolor: backgroundColor,
                  prefix: true,
                  preIcon: Icons.arrow_back_ios,
                  preIconColor: Colors.blue,
                  title: CustomText(
                      text: 'Login'.tr(), fontSize: 25, color: Colors.black),
                  posfix: false),

              //Size Box
              SizedBox(
                height: size.height * 0.08,
              ),

              //Email Field
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: TextField(
                  controller: _viewModel.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email'.tr(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),

              //Size Box
              SizedBox(
                height: size.height * 0.02,
              ),

              //Password Field
              SizedBox(
                  width: size.width * 0.9,
                  height: size.height * 0.06,
                  child: CustomPassword(
                      passwordController: _viewModel.passwordController,
                      obsecureText: _obsecureText,
                      toggle: toggle)),

              //Sized Box
              SizedBox(
                height: size.height * 0.05,
              ),

              // Login Button
              customButton(
                text: 'Login'.tr(),
                textSize: 25,
                textColor: whiteColor,
                size: size,
                context: context,
                onTap: () async {
                  try {
                    Login user = await LoginApi().userLogin(
                        _viewModel.emailController.text,
                        _viewModel.passwordController.text);
                    if (user.status == '1') {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString("customerId", user.customerId!);
                      await prefs.setString("languageId", user.language_id!);
                      Navigator.pushNamed(context, HomeScreen.routename);
                    } else {
                      print('wrong data');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),

              //Sized Box
              SizedBox(
                height: size.height * 0.06,
              ),

              //Forget Password
              SizedBox(
                  height: size.height * 0.025,
                  width: size.width * 0.45,
                  child: HyperText('Forgot Password')),

              //Sized Box
              SizedBox(height: size.height * 0.04),

              //Text Row
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: size.width * 0.3)),
                  Text(
                    'Not a User',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
                  HyperText('Register Now'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
