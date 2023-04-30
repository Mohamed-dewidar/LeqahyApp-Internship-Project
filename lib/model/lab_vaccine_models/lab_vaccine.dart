import 'package:flutter/cupertino.dart';

class LabVaccine {
  String? productTypeCode;
  String? productTypeName;
  String? extraCategory;
  String? name;
  String? quantity;
  String? dose;
  String? sortOrder;

  LabVaccine(
      {this.productTypeCode,
      this.productTypeName,
      this.extraCategory,
      this.name,
      this.quantity,
      this.dose,
      this.sortOrder});

  factory LabVaccine.fromJson(Map<String, dynamic> json) {
    LabVaccine vaccine = LabVaccine();
    vaccine.productTypeCode = json['product_type_code'];
    vaccine.productTypeName = json['product_type_name'];
    vaccine.extraCategory = json['extra_category'];
    vaccine.name = json['name'];
    vaccine.quantity = json['quantity'];
    vaccine.dose = json['dose'];
    vaccine.sortOrder = json['sort_order'];
    return vaccine;
  }
}
