import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/order_model/order_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConfirmOrderApi {
  Future<OrderModel> confirmOrder() async {
    OrderModel order = OrderModel();
    String url = 'add-order-details';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_id': UserData().customerId,
        'customer_group_id': UserData().customerGroupId,
        'firstname': UserData().firstName,
        'lastname': UserData().lastName,
        'email': UserData().email,
        'telephone': UserData().telephone,
        'payment_firstname': UserData().firstName,
        'payment_lastname': UserData().lastName,
        'payment_company': 'Medavic',
        'payment_address_1': UserData().address1,
        'payment_address_2': 'SS',
        'payment_city': UserData().city,
        'payment_postcode': UserData().postCode,
        'payment_country': UserData().country,
        'payment_country_id': '02',
        'payment_zone': UserData().zoneName,
        'payment_zone_id': UserData().zoneId,
        'payment_method': 'Cash on delivery',
        'shipping_firstname': UserData().shippingFirstName,
        'shipping_lastname': UserData().shippingLastName,
        'shipping_company': 'Medivac',
        'shipping_address_1': UserData().shippingAddress1,
        'shipping_address_2': 'SS',
        'shipping_city': UserData().shippingCity,
        'shipping_postcode': UserData().shippingPostCode,
        'shipping_country': UserData().country,
        'shipping_country_id': '02',
        'shipping_zone': UserData().shippingZoneName,
        'shipping_zone_id': UserData().shippingZoneId,
        'shipping_method': 'On delivery',
        'language_id': UserData().languageId,
        'ip': UserData().ip
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      print(res.body);
    } catch (e) {
      print(e);
    }

    return order;
  }
}
