import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:leqahy/constant/cach_helper.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/Login%20Models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  String url =
      'https://leqahyapp.hypercare-eg.com/leqahy-app/api/v1/user/login';
  Future<Login> userLogin(String email, String password) async {
    Login user = Login();
    var headers = {"Content-Type": "application/json", "Accept": "/"};
    var body = jsonEncode({"email": email, "password": password});
    try {
      var res = await http.post(Uri.parse(url), headers: headers, body: body);
      var JsonDec = jsonDecode(res.body);
      user = Login.fromJson(JsonDec['User']);

      CachHelper.saveData(key: 'customerId', value: user.customerId);
      CachHelper.saveData(
          key: 'customerGroupId', value: user.customer_group_id);

      CachHelper.saveData(key: 'languageId', value: user.language_id);
      CachHelper.saveData(key: 'firstName', value: user.firstname);
      CachHelper.saveData(key: 'lastName', value: user.lastname);
      CachHelper.saveData(key: 'email', value: user.email);
      CachHelper.saveData(key: 'telephone', value: user.telephone);

      //Shipping
      CachHelper.saveData(key: 'shippingfirstName', value: user.firstname);
      CachHelper.saveData(key: 'shippinglastName', value: user.lastname);
    } catch (e) {
      print(e);
    }
    return user;
  }
}
