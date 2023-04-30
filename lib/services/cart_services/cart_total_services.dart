import 'package:leqahy/model/cart_model/cart_total.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constant/constant.dart';

class CartTotalApi {
  Future<CartTotal> totalAmount(String customerId) async {
    CartTotal total = CartTotal();
    String url = 'allTotal-cart';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_id': customerId,
      });
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      total = CartTotal.fromJson(decRes['Your Chick out']);
      print(total.total);
    } catch (e) {
      print(e);
    }
    return total;
  }
}
