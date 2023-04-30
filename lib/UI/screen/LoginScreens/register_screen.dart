import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leqahy/UI/screen/location_screen.dart';
import 'package:leqahy/UI/screen/LoginScreens/login_screen.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_appbar.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';

import 'package:leqahy/UI/widget/legahy_logo.dart';
import 'package:leqahy/UI/widget/leqahy_text.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/services/login%20services/register_service.dart';
import 'package:leqahy/viewmodel/login%20viewmodel/register_screen_viewmodel.dart';

import '../../widget/custom_wigets/custom_checkbox.dart';
import '../../widget/custom_wigets/custom_password.dart';
import '../../widget/custom_wigets/custom_text_field.dart';
import '../../widget/hyper_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routename = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel _viewModel = RegisterScreenViewModel();
  bool value = false;
  bool _obsecureText = true;
  void _toggle() {
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
        child: Center(
          child: Column(children: [
            //Sized Box
            SizedBox(
              height: size.height * 0.04,
            ),

            //Legahy Logo
            const LeqahyLogo(),

            //Size Box
            SizedBox(
              height: size.height * 0.007,
            ),

            //Lehgahy Text
            const LeqahyText(),

            //Sized Box
            SizedBox(
              height: size.height * 0.07,
            ),

            //Register Text
            customAppBar(
                prefix: true,
                preIcon: Icons.arrow_back_ios,
                title: CustomText(
                    text: 'Register', fontSize: 25, color: Colors.black),
                backgrondcolor: backgroundColor,
                onPressed: () =>
                    {Navigator.pushNamed(context, LoginScreen.routename)},
                posfix: false),

            //Sized box
            SizedBox(
              height: size.height * 0.04,
            ),

            //Name Field
            SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: CustomTextFeild(
                    size: size,
                    hintText: 'Name',
                    controller: _viewModel.nameController)),
            //Sized box
            SizedBox(
              height: size.height * 0.01,
            ),

            //Email
            SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: CustomTextFeild(
                    size: size,
                    hintText: 'Email',
                    controller: _viewModel.emailController)),
            //Sized box
            SizedBox(
              height: size.height * 0.01,
            ),

            //Phone
            SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: CustomTextFeild(size: size, hintText: 'Mobile Phone')),
            //Sized box
            SizedBox(
              height: size.height * 0.01,
            ),

            //Password
            SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: CustomPassword(
                    passwordController: _viewModel.passwwordContoller,
                    obsecureText: _obsecureText,
                    toggle: _toggle)),
            //Sized box
            SizedBox(
              height: size.height * 0.01,
            ),

            //Text Row
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: size.width * 0.06)),
                customCheckbox(
                    value: value,
                    onChanged: (val) {
                      setState(() {
                        value = val!;
                      });
                    }),
                Text(
                  'I agree on',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                Padding(padding: EdgeInsets.only(left: size.width * 0.02)),
                InkWell(
                  onTap: () => const RegisterScreen(),
                  child: HyperText('terms and condtions'),
                ),
              ],
            ),
            //Sized Box
            SizedBox(
              height: size.height * 0.03,
            ),

            //Register Button
            SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.06,
                child: customButton(
                  text: 'Register',
                  textSize: 25,
                  size: size,
                  context: context,
                  onTap: () async {
                    RegisterApi().adduser(
                        _viewModel.nameController.text,
                        _viewModel.emailController.text,
                        _viewModel.phoneController.text,
                        _viewModel.passwwordContoller.text);
                  },
                )),

            //Sized box
            SizedBox(
              height: size.height * 0.02,
            ),

            //Or Text
            Text(
              'Or',
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
            ),

            //Sized box
            SizedBox(
              height: size.height * 0.02,
            ),

            //Reg With Google or facebook
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () => print('facebook'),
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: darkBlueColor,
                        size: 45,
                      )),
                  InkWell(
                      onTap: () => print('google'),
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                        size: 45,
                      )),
                  InkWell(
                      onTap: () => print('github'),
                      child: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 45,
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
