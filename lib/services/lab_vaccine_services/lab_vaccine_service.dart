import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/lab_vaccine_models/lab_vaccine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:leqahy/viewmodel/lab_vaccine_screen_viewmodel/lab_vaccine_screen_viewmodel.dart';

class LabVaccineApi {
  LabVaccineScreenViewModel _vm = LabVaccineScreenViewModel();
  Future<List<LabVaccine>> fetctVaccine({String? languageId}) async {
    List<LabVaccine> vaccine = [];

    String url = 'get-main-oc_vaccine_products';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({'language_id': languageId});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(decRes['Product Vaccines']);

      _vm.setLapProducts(
          decList.map((e) => e['product_type_name']).toList().toSet());

      vaccine = decList.map(
        (e) {
          LabVaccineScreenViewModel.ExapandView[e['product_type_name']] =
              LabVaccineScreenViewModel.ExapandView[e['product_type_name']] ??
                  false;

          LabVaccineScreenViewModel.selectMap[e['name']] =
              LabVaccineScreenViewModel.selectMap[e['name']] ?? false;

          return LabVaccine.fromJson(e);
        },
      ).toList();
    } catch (e) {
      print(e);
    }

    return vaccine;
  }
}
