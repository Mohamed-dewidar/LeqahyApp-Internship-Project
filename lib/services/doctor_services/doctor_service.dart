import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy/constant/constant.dart';
import '../../model/doctor_model/doctor_model.dart';

class DoctorApi {
  Future<List<Doctor>> fetchDoctors({String? languageId}) async {
    List<Doctor> doctors = [];
    String url = 'get-main-t_doctors';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({'language_id': languageId});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(decRes['Doctors']);
      doctors = decList.map((e) => Doctor.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return doctors;
  }
}
