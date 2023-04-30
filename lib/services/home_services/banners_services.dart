import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leqahy/model/home_models/banners_model/oc_banner.dart';
import 'package:leqahy/viewmodel/home_viewmodel/home_screen_viewmodel.dart';

class BannersApi {
  HomeScreenViewModel _vm = HomeScreenViewModel();
  Future<List<OcBanners>> fetchBanners() async {
    List<OcBanners> list = [];
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var res = await http.get(Uri.parse(_vm.bannersURL), headers: headers);
      if (res.statusCode == 200) {
        var jsonDec = jsonDecode(res.body);
        List<Map<String, dynamic>> decList =
            List<Map<String, dynamic>>.from(jsonDec['Oc_banners']);
        list = decList.map((e) => OcBanners.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}
