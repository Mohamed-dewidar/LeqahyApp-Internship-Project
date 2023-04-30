import 'package:http/http.dart';

class RegisterModel {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? addressId;
  String? customerGroupId;
  String? ip;
  String? languageId;
  String? phone;
  String? fax;

  RegisterModel(
      {this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.addressId,
      this.customerGroupId,
      this.ip,
      this.languageId,
      this.phone,
      this.fax});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['email'] = email;
    data['telephone'] = phone;
    data['password'] = password;

    return data;
  }
}
