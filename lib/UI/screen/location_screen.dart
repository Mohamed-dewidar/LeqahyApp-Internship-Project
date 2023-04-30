import 'package:flutter/material.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_appbar.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';
import '../widget/custom_wigets/custom_dropdown.dart';
import '../widget/legahy_logo.dart';
import '../widget/leqahy_text.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  static const String routename = 'LocationScreen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> items = ['one', 'two', 'three'];

  // onChangedGov(text) {
  //   setState(() {
  //     _valueGov = text;
  //   });
  // }

  String _valueDis = 'one';
  onChangedDis(text) {
    setState(() {
      _valueDis = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    String _valueGov = items.first;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            //Sized Box
            SizedBox(
              height: size.height * 0.04, // 4 %
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
                preIconColor: Colors.black,
                title: CustomText(
                    text: 'Register', fontSize: 25, color: Colors.black),
                posfix: false),

            //Sized box
            SizedBox(
              height: size.height * 0.009,
            ),

            //Locatin Image
            SizedBox(
              height: size.height * 0.146,
              width: size.width * 0.41,
              child: Image.asset('assets/images/location.jpeg'),
            ),

            //Sized box
            SizedBox(
              height: size.height * 0.02,
            ),

            //Location text
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.87,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.87 * 0.22),
                child: const Text(
                  'Choose Location',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),

            //Sized box
            SizedBox(
              height: size.height * 0.01,
            ),

            //Governorate dropdown
            SizedBox(
                // height: size.height * 0.05,
                width: size.width * 0.848,
                child: customDropDownButton(
                    size: size,
                    value: _valueGov,
                    items: items,
                    onChanged: (text) {
                      setState(() {
                        _valueGov = text;
                      });
                    },
                    text: 'Governorate')),

            //Sized Box
            SizedBox(
              height: size.height * 0.033,
            ),

            // //Governorate text
            // CustomText(text: 'District'),

            // //Sized box
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            //District dropdown
            SizedBox(
                // height: size.height * 0.05,
                width: size.width * 0.848,
                child: customDropDownButton(
                    size: size,
                    value: _valueDis,
                    items: items,
                    onChanged: onChangedDis,
                    text: 'Choose District')),
            //sized box
            SizedBox(
              height: size.height * 0.03,
            ),

            //Button
            SizedBox(
                // height: size.height * 0.07,
                width: size.width * 0.92,
                child: customButton(
                  text: 'Register',
                  textSize: 25,
                  textColor: whiteColor,
                  size: size,
                  context: context,
                  onTap: () => {},
                )),
          ]),
        ),
      ),
    ));
  }
}
