// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString?);

import 'dart:convert';

class Product {
  String? productId;
  String? model;
  String? sku;
  String? upc;
  String? ean;
  String? jan;
  String? isbn;
  String? mpn;
  String? mainQuantity;
  String? image;
  String? manufacturerId;
  String? shipping;
  String? price;
  String? points;
  String? taxClassId;
  String? dateAvailable;
  String? weight;
  String? weightClassId;
  String? length;
  String? width;
  String? height;
  String? lengthClassId;
  String? subtract;
  String? minimum;
  String? sortOrder;
  String? status;
  String? viewed;
  String? dateAdded;
  String? dateModified;
  String? productChecks;
  String? productName;

  Product({
    this.productId,
    this.model,
    this.sku,
    this.upc,
    this.ean,
    this.jan,
    this.isbn,
    this.mpn,
    this.mainQuantity,
    this.image,
    this.manufacturerId,
    this.shipping,
    this.price,
    this.points,
    this.taxClassId,
    this.dateAvailable,
    this.weight,
    this.weightClassId,
    this.length,
    this.width,
    this.height,
    this.lengthClassId,
    this.subtract,
    this.minimum,
    this.sortOrder,
    this.status,
    this.viewed,
    this.dateAdded,
    this.dateModified,
    this.productChecks,
    this.productName,
  });
  factory Product.fromJson(Map<String?, dynamic> json) => Product(
        productId: json["product_id"],
        model: json["model"],
        sku: json["sku"],
        upc: json["upc"],
        ean: json["ean"],
        jan: json["jan"],
        isbn: json["isbn"],
        mpn: json["mpn"],
        mainQuantity: json["Main Quantity"],
        image: json["image"],
        manufacturerId: json["manufacturer_id"],
        shipping: json["shipping"],
        price: json["price"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        dateAvailable: json["date_available"],
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        lengthClassId: json["length_class_id"],
        subtract: json["subtract"],
        minimum: json["minimum"],
        sortOrder: json["sort_order"],
        status: json["status"],
        viewed: json["viewed"],
        dateAdded: json["date_added"],
        dateModified: json["date_modified"],
        productChecks: json["Product_Checks"],
        productName: json["product_name"],
      );

  Map<String?, dynamic> toJson() => {
        "product_id": productId,
        "model": model,
        "sku": sku,
        "upc": upc,
        "ean": ean,
        "jan": jan,
        "isbn": isbn,
        "mpn": mpn,
        "Main Quantity": mainQuantity,
        "image": image,
        "manufacturer_id": manufacturerId,
        "shipping": shipping,
        "price": price,
        "points": points,
        "tax_class_id": taxClassId,
        "date_available": dateAvailable,
        "weight": weight,
        "weight_class_id": weightClassId,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "subtract": subtract,
        "minimum": minimum,
        "sort_order": sortOrder,
        "status": status,
        "viewed": viewed,
        "date_added": dateAdded,
        "date_modified": dateModified,
        "Product_Checks": productChecks,
        "product_name": productName,
      };
}
