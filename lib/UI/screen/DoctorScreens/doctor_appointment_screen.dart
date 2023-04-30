import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leqahy/UI/screen/DoctorScreens/available_appointments_selectwidget.dart';
import 'package:leqahy/UI/screen/DoctorScreens/date_time_selectwidget.dart';
import 'package:leqahy/UI/widget/custom_button.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/UI/widget/custom_wigets/cutstome_appBar.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/viewmodel/doctor_screen_viewmode/doctor_appointment_viewmodel.dart';
import 'package:provider/provider.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  static String routename = 'DoctorAppointmnetScreen';
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  DoctorAppointmentViewModel _vm = DoctorAppointmentViewModel();
  var msg;
  @override
  Widget build(BuildContext context) {
    _vm.daysCount();
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Consumer<DoctorAppointmentViewModel>(
                builder: (context, appointment, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * .02),
                            child: customAppBarNew(
                                size: size,
                                leading: Container(
                                  width: size.width * 0.1,
                                ),
                                title: Image.asset(_vm.titleImage),
                                actions: Container(
                                    width: size.width * 0.1,
                                    child: customIcon(
                                      click: true,
                                      icon: _vm.actionBackIcon,
                                      iconColor: darkBlueColor,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    )))),
                        Padding(
                            padding:
                                EdgeInsets.only(bottom: size.height * 0.02),
                            child: CustomText(
                                text: appointment.doctor.doctorName!,
                                color: darkBlueColor,
                                fontSize: size.width * 0.07,
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                  right: size.width * 0.02),
                              color: Colors.grey[600],
                              width: size.width * 0.03,
                              height: size.height * 0.05,
                            ),
                            CustomText(
                                text: 'Doctor',
                                color: darkBlueColor,
                                fontSize: size.width * 0.05)
                          ],
                        ),
                        const SelectDate(),
                        Container(
                            alignment: AlignmentDirectional.centerStart,
                            padding: EdgeInsets.only(left: size.width * 0.04),
                            child: CustomText(
                                text: 'Availabe Appointment',
                                color: darkBlueColor,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold)),
                        Divider(
                          color: darkBlueColor,
                          indent: size.width * 0.03,
                          endIndent: size.width * 0.45,
                          thickness: size.height * 0.005,
                        ),
                        const AvailableAppointments(),
                        Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.2,
                                left: size.width * 0.25,
                                right: size.width * 0.25),
                            child: customButton(
                              size: size,
                              textColor: whiteColor,
                              context: context,
                              text: 'Comfirm',
                              onTap: () async {
                                msg = await appointment.addAppointment();
                                if (msg == 'تم اضافة الوعد بنجاح') {
                                  return Fluttertoast.showToast(
                                      msg: msg,
                                      textColor: whiteColor,
                                      backgroundColor: greenColor);
                                } else {
                                  return Fluttertoast.showToast(
                                      msg: msg,
                                      textColor: whiteColor,
                                      backgroundColor: redColor);
                                }
                              },
                            ))
                      ],
                    ))));
  }
}
