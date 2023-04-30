// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString?);

import 'dart:convert';

class UserDataModel {
  UserDataModel({
    this.customerId,
    this.customerGroupId,
    this.languageId,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.fax,
    this.salt,
    this.addressId,
    this.customField,
    this.ip,
    this.status,
    this.safe,
    this.code,
    this.token,
    this.widthLine,
    this.heightLine,
    this.address1,
    this.address2,
    this.city,
    this.postcode,
    this.countryName,
    this.isoCode2,
    this.isoCode3,
    this.zoneName,
    this.zoneCode,
    this.createdAt,
    this.customerGroupName,
  });

  int? customerId;
  String? customerGroupId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  dynamic? fax;
  dynamic? salt;
  String? addressId;
  dynamic? customField;
  String? ip;
  String? status;
  dynamic? safe;
  String? code;
  String? token;
  String? widthLine;
  String? heightLine;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? countryName;
  String? isoCode2;
  String? isoCode3;
  String? zoneName;
  String? zoneCode;
  String? createdAt;
  String? customerGroupName;

  factory UserDataModel.fromJson(Map<String?, dynamic?> json) => UserDataModel(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        languageId: json["language_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        fax: json["fax"],
        salt: json["salt"],
        addressId: json["address_id"],
        customField: json["custom_field"],
        ip: json["ip"],
        status: json["status"],
        safe: json["safe"],
        code: json["code"],
        token: json["token"],
        widthLine: json["width_line"],
        heightLine: json["height_line"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        postcode: json["postcode"],
        countryName: json["country_name"],
        isoCode2: json["iso_code_2"],
        isoCode3: json["iso_code_3"],
        zoneName: json["zone_name"],
        zoneCode: json["zone_code"],
        createdAt: json["created_at"],
        customerGroupName: json["Customer_group_name"],
      );

  Map<String?, dynamic?> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "language_id": languageId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "fax": fax,
        "salt": salt,
        "address_id": addressId,
        "custom_field": customField,
        "ip": ip,
        "status": status,
        "safe": safe,
        "code": code,
        "token": token,
        "width_line": widthLine,
        "height_line": heightLine,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "postcode": postcode,
        "country_name": countryName,
        "iso_code_2": isoCode2,
        "iso_code_3": isoCode3,
        "zone_name": zoneName,
        "zone_code": zoneCode,
        "created_at": createdAt,
        "Customer_group_name": customerGroupName,
      };
}
