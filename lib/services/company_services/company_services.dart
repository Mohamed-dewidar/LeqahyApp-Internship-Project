import 'dart:convert';

import 'package:leqahy/model/company_models/company_model.dart';
import 'package:leqahy/viewmodel/company_screen_viewmodel/company_screen_viewmodel.dart';

import 'package:http/http.dart' as http;

class CompanyApi {
  CompanyScreenViewModel _vm = CompanyScreenViewModel();

  Future<List<Company>> fetchCompany(String classId) async {
    List<Company> list = [];
    var headers = {"Content-Type": "application/json", "Accept": "/"};
    var body = {'class_id': classId, "language_id": "1"};
    try {
      var res = await http.post(Uri.parse(_vm.companyUrl),
          headers: headers, body: jsonEncode(body));
      var jsonDec = jsonDecode(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(jsonDec['Companies']);
      print(res.body);
      list = decList.map((e) => Company.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }

    return list;
  }
}
