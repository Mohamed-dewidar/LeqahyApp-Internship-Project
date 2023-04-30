import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leqahy/constant/constant.dart';
import 'package:leqahy/model/product_model/description_image.dart';
import 'package:leqahy/model/product_model/product_description_model.dart';

class DescriptionApi {
  Future<ProductDescription> fetchDescription(
      String productId, String languageId) async {
    ProductDescription desc = ProductDescription();
    try {
      String url = 'get-AllProducts-Info_details2';
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body =
          jsonEncode({'product_id': productId, 'language_id': languageId});
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(decRes['Product Description']);
      desc = ProductDescription.fromJson(decList[0]);
    } catch (e) {
      print(e);
    }
    return desc;
  }

  Future<List<DescriptionImage>> fetchDescImage(String productId) async {
    List<DescriptionImage> image = [];

    try {
      String url = 'get-AllProducts-Info_details4';
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({'product_id': productId});
      print(productId);
      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);
      print(res.body);
      List<Map<String, dynamic>> decList =
          List<Map<String, dynamic>>.from(decRes['Product Images']);

      image = decList.map((e) => DescriptionImage.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return image;
  }
}
