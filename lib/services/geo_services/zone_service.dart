import 'package:http/http.dart' as http;
import 'package:leqahy/constant/constant.dart';
import 'dart:convert';

import 'package:leqahy/model/geo_models/zones_model.dart';

class ZoneApi {
  Future<List<ZoneModel>> fetchZones() async {
    List<ZoneModel> zones = [];
    String url = 'get-main-oc_egypt_zones';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({'country_id': '02'});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      if (res.statusCode == 200) {
        var decRes = jsonDecode(res.body);
        var decList = List<Map<String, dynamic>>.from(decRes['Zones']);
        zones = decList.map((e) => ZoneModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return zones;
  }
}
