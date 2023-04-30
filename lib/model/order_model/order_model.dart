import 'dart:convert';

class OrderModel {
  OrderModel({
    this.customerId,
    this.customerGroupId,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.paymentFirstname,
    this.paymentLastname,
    this.paymentCompany,
    this.paymentAddress1,
    this.paymentAddress2,
    this.paymentCity,
    this.paymentPostcode,
    this.paymentCountry,
    this.paymentCountryId,
    this.paymentZone,
    this.paymentZoneId,
    this.paymentMethod,
    this.shippingFirstname,
    this.shippingLastname,
    this.shippingCompany,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingCity,
    this.shippingPostcode,
    this.shippingCountry,
    this.shippingCountryId,
    this.shippingZone,
    this.shippingZoneId,
    this.shippingMethod,
    this.languageId,
    this.ip,
  });

  String? customerId;
  String? customerGroupId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? paymentFirstname;
  String? paymentLastname;
  String? paymentCompany;
  String? paymentAddress1;
  String? paymentAddress2;
  String? paymentCity;
  String? paymentPostcode;
  String? paymentCountry;
  String? paymentCountryId;
  String? paymentZone;
  String? paymentZoneId;
  String? paymentMethod;
  String? shippingFirstname;
  String? shippingLastname;
  String? shippingCompany;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingPostcode;
  String? shippingCountry;
  String? shippingCountryId;
  String? shippingZone;
  String? shippingZoneId;
  String? shippingMethod;
  String? languageId;
  String? ip;

  factory OrderModel.fromJson(Map<String?, dynamic> json) => OrderModel(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        paymentFirstname: json["payment_firstname"],
        paymentLastname: json["payment_lastname"],
        paymentCompany: json["payment_company"],
        paymentAddress1: json["payment_address_1"],
        paymentAddress2: json["payment_address_2"],
        paymentCity: json["payment_city"],
        paymentPostcode: json["payment_postcode"],
        paymentCountry: json["payment_country"],
        paymentCountryId: json["payment_country_id"],
        paymentZone: json["payment_zone"],
        paymentZoneId: json["payment_zone_id"],
        paymentMethod: json["payment_method"],
        shippingFirstname: json["shipping_firstname"],
        shippingLastname: json["shipping_lastname"],
        shippingCompany: json["shipping_company"],
        shippingAddress1: json["shipping_address_1"],
        shippingAddress2: json["shipping_address_2"],
        shippingCity: json["shipping_city"],
        shippingPostcode: json["shipping_postcode"],
        shippingCountry: json["shipping_country"],
        shippingCountryId: json["shipping_country_id"],
        shippingZone: json["shipping_zone"],
        shippingZoneId: json["shipping_zone_id"],
        shippingMethod: json["shipping_method"],
        languageId: json["language_id"],
        ip: json["ip"],
      );

  Map<String?, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "payment_firstname": paymentFirstname,
        "payment_lastname": paymentLastname,
        "payment_company": paymentCompany,
        "payment_address_1": paymentAddress1,
        "payment_address_2": paymentAddress2,
        "payment_city": paymentCity,
        "payment_postcode": paymentPostcode,
        "payment_country": paymentCountry,
        "payment_country_id": paymentCountryId,
        "payment_zone": paymentZone,
        "payment_zone_id": paymentZoneId,
        "payment_method": paymentMethod,
        "shipping_firstname": shippingFirstname,
        "shipping_lastname": shippingLastname,
        "shipping_company": shippingCompany,
        "shipping_address_1": shippingAddress1,
        "shipping_address_2": shippingAddress2,
        "shipping_city": shippingCity,
        "shipping_postcode": shippingPostcode,
        "shipping_country": shippingCountry,
        "shipping_country_id": shippingCountryId,
        "shipping_zone": shippingZone,
        "shipping_zone_id": shippingZoneId,
        "shipping_method": shippingMethod,
        "language_id": languageId,
        "ip": ip,
      };
}
