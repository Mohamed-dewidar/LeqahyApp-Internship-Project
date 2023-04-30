import 'dart:convert';
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/product_model/prodcut_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<Product>> fetchProduct(
      String companyId, String customerId, String langaugeId) async {
    var url = '$BaseUrl/get-AllProducts-Info';
    List<Product> list = [];
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'company_id': companyId,
        'customer_id': customerId,
        'language_id': langaugeId
      });
      var res = await http.post(Uri.parse(url), headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      List<Map<String, dynamic>> declist =
          List<Map<String, dynamic>>.from(decRes['Products']);
      list = declist.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return list;
  }
}
