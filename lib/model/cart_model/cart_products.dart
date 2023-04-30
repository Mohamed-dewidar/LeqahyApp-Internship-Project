// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString?);

import 'dart:convert';

class CartProducts {
  CartProducts({
    this.productId,
    this.customerId,
    this.model,
    this.quantity,
    this.mainQuantity,
    this.image,
    this.manufacturerId,
    this.shipping,
    this.price,
    this.points,
    this.taxClassId,
    this.dateAvailable,
    this.subtract,
    this.minimum,
    this.sortOrder,
    this.status,
    this.viewed,
    this.dateAdded,
    this.dateModified,
    this.productName,
  });

  String? productId;
  String? customerId;
  String? model;
  String? quantity;
  String? mainQuantity;
  String? image;
  String? manufacturerId;
  String? shipping;
  String? price;
  String? points;
  String? taxClassId;
  String? dateAvailable;
  String? subtract;
  String? minimum;
  String? sortOrder;
  String? status;
  String? viewed;
  String? dateAdded;
  String? dateModified;
  String? productName;

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        productId: json["product_id"],
        customerId: json["customer_id"],
        model: json["model"],
        quantity: json["quantity"],
        mainQuantity: json["Main_Quantity"],
        image: json["image"],
        manufacturerId: json["manufacturer_id"],
        shipping: json["shipping"],
        price: json["price"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        dateAvailable: json["date_available"],
        subtract: json["subtract"],
        minimum: json["minimum"],
        sortOrder: json["sort_order"],
        status: json["status"],
        viewed: json["viewed"],
        dateAdded: json["date_added"],
        dateModified: json["date_modified"],
        productName: json["product_name"],
      );

  Map<String?, dynamic> toJson() => {
        "product_id": productId,
        "customer_id": customerId,
        "model": model,
        "quantity": quantity,
        "Main_Quantity": mainQuantity,
        "image": image,
        "manufacturer_id": manufacturerId,
        "shipping": shipping,
        "price": price,
        "points": points,
        "tax_class_id": taxClassId,
        "date_available": dateAvailable,
        "subtract": subtract,
        "minimum": minimum,
        "sort_order": sortOrder,
        "status": status,
        "viewed": viewed,
        "date_added": dateAdded,
        "date_modified": dateModified,
        "product_name": productName,
      };
}
