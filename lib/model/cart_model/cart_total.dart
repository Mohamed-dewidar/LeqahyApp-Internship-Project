// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CartTotal welcomeFromJson(String str) => CartTotal.fromJson(json.decode(str));

String welcomeToJson(CartTotal data) => json.encode(data.toJson());

class CartTotal {
  CartTotal({
    this.shipping,
    this.discount,
    this.fees,
    this.subTotal,
    this.total,
  });

  int? shipping;
  int? discount;
  int? fees;
  int? subTotal;
  int? total;

  factory CartTotal.fromJson(Map<String, dynamic> json) => CartTotal(
        shipping: json["Shipping"],
        discount: json["Discount"],
        fees: json["Fees"],
        subTotal: json["Sub Total"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "Shipping": shipping,
        "Discount": discount,
        "Fees": fees,
        "Sub Total": subTotal,
        "Total": total,
      };
}
