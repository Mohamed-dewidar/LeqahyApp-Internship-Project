import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/remove_cart_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemvoeCartItemApi {
  Future<RemoveItem> deleteItem(String customerId, String productID) async {
    RemoveItem item = RemoveItem();
    String url = 'removeItem-from-cart';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_id': customerId,
        'product_id': productID,
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);

      var decRes = jsonDecode(res.body);
      item = RemoveItem.fromJson(decRes);
    } catch (e) {
      print(e);
    }
    return item;
  }
}
