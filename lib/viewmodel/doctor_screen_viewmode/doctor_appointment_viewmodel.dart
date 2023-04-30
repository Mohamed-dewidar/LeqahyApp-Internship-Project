import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/doctor_model/doctor_model.dart';
import 'package:leqahy/services/doctor_services/add_appointment.dart';
import 'package:leqahy/services/doctor_services/doctor_service.dart';

class DoctorAppointmentViewModel extends ChangeNotifier {
  List<Doctor> doctors = [];
  Doctor doctor = Doctor();

  grtDoctor({String? languageId}) async {
    doctors = await DoctorApi().fetchDoctors(languageId: languageId);
    notifyListeners();
  }

  //AppBar
  //Title
  String titleImage = 'assets/images/logo_en.png';
  //Actions
  IconData actionBackIcon = FontAwesomeIcons.angleRight;

  //Month Days Selection
  IconData nextMonthIcon = FontAwesomeIcons.arrowRight;
  IconData prevMonthIcon = FontAwesomeIcons.arrowLeft;
  int pickedMonthNumber = DateTime.now().month;
  int pickedDayNumber = DateTime.now().day;
  String pickedTime = '';
  List<String> daysList = [];
  List<bool> daysSelectList = [];
  var timesSelectList = [false, false];
  List<String> times = ['12:30', '2:00'];

  Map<int, String> months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'Mar',
    6: 'June',
    7: 'July',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };

  Map<int, String> weekdays = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wensday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  };

  daysCount() {
    daysList = [];

    var daysInMonth =
        DateTime(DateTime.now().year, pickedMonthNumber + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      int weekday = DateTime(DateTime.now().year, pickedMonthNumber, i).weekday;
      daysList.add(weekdays[weekday]!);
      daysSelectList.add(false);
      if (i == pickedDayNumber) {
        daysSelectList[i - 1] = true;
      }
    }
  }

  nextMonth() {
    pickedMonthNumber++;
    if (pickedMonthNumber > 12) pickedMonthNumber = 1;
    notifyListeners();
  }

  prevMonth() {
    pickedMonthNumber--;
    if (pickedMonthNumber < 1) pickedMonthNumber = 12;
    notifyListeners();
  }

  daySelect({required int index}) {
    pickedDayNumber = index + 1;
    daysSelectList.fillRange(0, daysSelectList.length - 1, false);
    daysSelectList[index] = true;
    notifyListeners();
  }

  timeSelect({required int index}) {
    timesSelectList = List.generate(times.length, (index) => false);
    timesSelectList[index] = true;
    pickedTime = times[index];

    notifyListeners();
  }

  Future<String> addAppointment() async {
    var msg = await addAppointmentApi().addAppoinment(
        doctorId: doctor.doctorId!,
        customerId: UserData().customerId,
        appointmentTime: pickedTime,
        appointmentDate:
            DateTime(DateTime.now().year, pickedMonthNumber, pickedDayNumber)
                .toString()
                .substring(0, 10));
    print(DateTime(DateTime.now().year, pickedMonthNumber, pickedDayNumber)
        .toString()
        .substring(0, 10));
    notifyListeners();
    return msg;
  }
}
