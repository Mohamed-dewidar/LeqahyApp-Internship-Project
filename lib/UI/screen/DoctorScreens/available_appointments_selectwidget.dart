import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/retry.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/viewmodel/doctor_screen_viewmode/doctor_appointment_viewmodel.dart';
import 'package:provider/provider.dart';

class AvailableAppointments extends StatefulWidget {
  const AvailableAppointments({super.key});

  @override
  State<AvailableAppointments> createState() => _AvailableAppointmentsState();
}

class _AvailableAppointmentsState extends State<AvailableAppointments> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var model = Provider.of<DoctorAppointmentViewModel>(context);
    if (model.times.length != 0) {
      return Container(
        height: size.height * 0.1,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                itemCount: model.times.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      model.timeSelect(index: index);
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                          color: model.timesSelectList[index]
                              ? darkBlueColor
                              : whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                color: darkBlueColor,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10)
                          ]),
                      child: CustomText(
                          text: model.times[index],
                          color: model.timesSelectList[index]
                              ? whiteColor
                              : darkBlueColor,
                          fontSize: size.width * 0.05),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.2, vertical: size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FontAwesomeIcons.clock,
              color: redColor,
            ),
            CustomText(
                text: 'No Appointment At that day',
                color: redColor,
                fontSize: size.width * 0.04)
          ],
        ),
      );
    }
  }
}
