import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:leqahy/constant/constant.dart';

class addAppointmentApi {
  Future<String> addAppoinment(
      {required String doctorId,
      required String customerId,
      required String appointmentTime,
      required String appointmentDate}) async {
    String msg = '';
    String url = 'get-main-t_add_appointment';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'doctor_id': doctorId,
        'customer_id': customerId,
        'appointment_time': appointmentTime,
        'appointment_date': appointmentDate
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      if (res.statusCode == 200) {
        var decRes = jsonDecode(res.body);
        msg = decRes['msg'];
      }
    } catch (e) {
      print(e);
    }
    return msg;
  }
}
