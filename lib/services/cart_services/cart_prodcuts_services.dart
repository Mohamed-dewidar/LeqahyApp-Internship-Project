import 'dart:convert';

import 'package:leqahy/model/cart_model/cart_products.dart';
import 'package:http/http.dart' as http;
import '../../constant/constant.dart';

class CartProductsApi {
  Future<List<CartProducts>> fetchProducts(
      String customerId, String languageId) async {
    List<CartProducts> products = [];
    String url = 'get-yourCart-Info';

    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body =
          jsonEncode({'customer_id': customerId, 'language_id': languageId});

      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);

      var decRes = jsonDecode(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(decRes['Your Cart']);

      products = decList.map((e) => CartProducts.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }

    return products;
  }
}
