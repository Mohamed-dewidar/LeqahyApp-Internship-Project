import 'package:flutter/cupertino.dart';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/clear_cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClearCartApi {
  Future<ClearCart> clearCart(String customerId) async {
    ClearCart cart = ClearCart();
    String url = 'removeAll-cart';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_id': customerId,
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      cart = ClearCart.fromJson(decRes);
    } catch (e) {
      print(e);
    }
    return cart;
  }
}
