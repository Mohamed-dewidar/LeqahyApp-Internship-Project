import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/screen/DoctorScreens/doctor_appointment_screen.dart';
import 'package:leqahy/UI/widget/DoctorScreensWidgets/doctor_card.dart';
import 'package:leqahy/model/doctor_model/doctor_model.dart';
import 'package:leqahy/services/doctor_services/doctor_service.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors.dart';
import '../../../viewmodel/doctor_screen_viewmode/doctor_appointment_viewmodel.dart';
import '../../../viewmodel/doctor_screen_viewmode/doctor_screen_viewmodel.dart';
import '../../widget/custom_wigets/custom_icon.dart';
import '../../widget/custom_wigets/custom_logo.dart';
import '../../widget/custom_wigets/custom_text.dart';
import '../../widget/custom_wigets/cutstome_appBar.dart';
import '../cart_screen.dart';

class DoctorScreen extends StatefulWidget {
  static const String routename = 'DoctorScreen';
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DoctorScreenViewModel _vm = DoctorScreenViewModel();
    return Consumer<DoctorAppointmentViewModel>(
      builder: (context, specDoctor, child) {
        specDoctor.grtDoctor(languageId: '1');
        return SafeArea(
            child: Scaffold(
                body: Column(children: [
          //AppBar
          Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              child: customAppBarNew(
                  size: size,
                  leading: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: customIcon(
                              click: true,
                              icon: _vm.leadingIcon2,
                              iconSize: size.width * 0.05,
                              iconColor: darkBlueColor)),
                      customIcon(
                        click: true,
                        icon: _vm.leadingIcon1,
                        iconSize: size.width * 0.05,
                        iconColor: darkBlueColor,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  title: Column(
                    children: [
                      customLogo(
                          width: size.width * 0.08,
                          height: size.height * 0.05,
                          image: _vm.leqahyLogoPath),
                      CustomText(
                          text: _vm.leqahyText,
                          color: darkBlueColor,
                          fontSize:
                              ((size.width * 0.05 * size.height * 0.03) * 0.04))
                    ],
                  ),
                  actions: Row(
                    children: [
                      customIcon(
                          click: true,
                          onTap: () {
                            print('Notifcation');
                          },
                          icon: _vm.actionsIcon2,
                          iconSize: size.width * 0.05,
                          iconColor: darkBlueColor),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: customIcon(
                            click: true,
                            icon: _vm.actionIcon1,
                            iconSize: size.width * 0.05,
                            iconColor: darkBlueColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CartScreen.routename);
                            },
                          ))
                    ],
                  ))),

          //Main Screen Title
          Row(
            children: [
              Container(
                height: size.height * 0.035,
                width: size.width * 0.02,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.03),
              ),
              CustomText(
                  text: 'Doctors',
                  color: darkBlueColor,
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.bold)
            ],
          ),

          //Doctors
          Expanded(
              child: ListView.builder(
            itemCount: specDoctor.doctors.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return doctorCard(
                drName: specDoctor.doctors[index].doctorName!,
                drImage: specDoctor.doctors[index].doctorImage!,
                speciality: specDoctor.doctors[index].specialityName!,
                fees: specDoctor.doctors[index].price!,
                size: size,
                onTap: () {
                  print(specDoctor.doctors[index].doctorId);
                  Provider.of<DoctorAppointmentViewModel>(context,
                          listen: false)
                      .doctor = specDoctor.doctors[index];

                  Navigator.pushNamed(
                      context, DoctorAppointmentScreen.routename);
                },
              );
            },
          ))
        ])));
      },
    );
  }
}
