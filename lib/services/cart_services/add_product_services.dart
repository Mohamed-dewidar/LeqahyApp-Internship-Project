import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/cart_model/add_product.dart';

class AddProductApi {
  Future<String> addProduct(String customerId, String productId) async {
    String msg = "";
    String url = 'add-onCart-Info';
    AddProduct product = AddProduct();
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body =
          jsonEncode({'customer_id': customerId, 'product_id': productId});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      msg = decRes['msg'];
      //product = AddProduct.fromJson(decRes['Your Total']);
    } catch (e) {
      print(e);
    }
    return msg;
  }
}
