import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/Login%20Models/user_data_model.dart';

class UserDataApi {
  Future<UserDataModel> getUserData(
      {String? customerId, String? languageId}) async {
    UserDataModel user = UserDataModel();
    String url = 'get-customer-data';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body =
          jsonEncode({'customer_id': customerId, 'language_id': languageId});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      if (res.statusCode == 200) {
        var decRes = jsonDecode(res.body);
        if (decRes['Customer Data'] != []) {
          user = UserDataModel.fromJson(decRes['Customer Data'][0]);

          CachHelper.saveData(key: 'address1', value: user.address1 ?? "");
          CachHelper.saveData(key: 'address2', value: user.address2 ?? "");
          CachHelper.saveData(key: 'city', value: user.city ?? "");
          CachHelper.saveData(key: 'zoneName', value: user.zoneName ?? "");
          CachHelper.saveData(key: 'postCode', value: user.postcode ?? "");
          CachHelper.saveData(key: 'country', value: user.countryName ?? "");
          CachHelper.saveData(key: 'ip', value: user.ip);
          //Shipping
          CachHelper.saveData(
              key: 'shippingaddress1', value: user.address1 ?? "");
          CachHelper.saveData(
              key: 'shippingaddress2', value: user.address2 ?? "");
          CachHelper.saveData(key: 'shippingcity', value: user.city ?? "");
          CachHelper.saveData(
              key: 'shippingzoneName', value: user.zoneName ?? "");
          CachHelper.saveData(
              key: 'shippingpostCode', value: user.postcode ?? "");
        }
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
