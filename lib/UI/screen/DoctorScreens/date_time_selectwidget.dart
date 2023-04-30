import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:leqahy/UI/widget/DoctorScreensWidgets/days_widget.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_icon.dart';
import 'package:leqahy/UI/widget/custom_wigets/custom_text.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:leqahy/viewmodel/doctor_screen_viewmode/doctor_appointment_viewmodel.dart';
import 'package:provider/provider.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appointmentModel = Provider.of<DoctorAppointmentViewModel>(context);
    appointmentModel.daysCount();
    return Container(
      height: size.height * 0.25,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.9,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: darkBlueColor, blurRadius: 10, blurStyle: BlurStyle.outer)
      ], color: greyColor, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        CustomText(
            text: 'Select Date and Time',
            color: darkBlueColor,
            fontSize: size.width * 0.04),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customIcon(
                  click: true,
                  icon: appointmentModel.prevMonthIcon,
                  iconColor: darkBlueColor,
                  onTap: () => appointmentModel.prevMonth()),
              CustomText(
                  text:
                      '${appointmentModel.months[appointmentModel.pickedMonthNumber]}, ${DateTime.now().year}',
                  color: darkBlueColor),
              customIcon(
                  click: true,
                  icon: appointmentModel.nextMonthIcon,
                  iconColor: darkBlueColor,
                  onTap: () => appointmentModel.nextMonth())
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            height: size.height * 0.15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                    itemCount: appointmentModel.daysList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return daysWidget(
                        dayNumber: index + 1,
                        dayName:
                            appointmentModel.daysList[index].substring(0, 3),
                        size: size,
                        select: appointmentModel.daysSelectList[index],
                        onTap: () {
                          appointmentModel.daySelect(index: index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
