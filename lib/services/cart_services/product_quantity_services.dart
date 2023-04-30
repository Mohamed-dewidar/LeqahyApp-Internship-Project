import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/product_quantity.dart';

class ProductQuantityApi {
  Future<Map<String, dynamic>> quantityUpdated(
      String customerId, String productId, String quantity) async {
    Map<String, dynamic> map = {};
    ProductQuantity product = ProductQuantity();
    String msg = "";
    String url = 'updateQuantity-cart';

    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_id': customerId,
        'product_id': productId,
        'quantity': quantity
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      map['msg'] = decRes['msg'];

      if (map['msg'] == 'تم تحديث الكمية بنجاح') {
        product = ProductQuantity.fromJson(decRes['Your Cart']);
        map['prodcut'] = product;
      }
    } catch (e) {
      print(e);
    }

    return map;
  }
}
