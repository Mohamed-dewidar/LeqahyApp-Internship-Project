import 'package:leqahy/constant/constant.dart';

import '../../model/lab_vaccine_models/add_reservation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservationApi {
  Future<String> makeReservation(
      {String? customerName,
      String? customerPhone,
      String? labName,
      String? checkCount,
      String? date,
      String? reserverName,
      List<Map<String, dynamic>>? items}) async {
    String msg = '';
    Reservation reservation = Reservation();
    String url = 'get-main-t_add_product';
    try {
      var headers = {"Content-Type": "application/json", "Accept": "/"};
      var body = jsonEncode({
        'customer_name': customerName,
        'customer_phone': customerPhone,
        'lab_name': labName,
        'check_count': checkCount,
        'labvac_date': date,
        'reserver_name': reserverName,
        'items': items
      });

      var res = await http.post(Uri.parse('$BaseUrl/$url'),
          headers: headers, body: body);
      var decRes = jsonDecode(res.body);

      msg = decRes['msg'];
      reservation = Reservation.fromJson(decRes['Product']);
    } catch (e) {
      print(e);
    }

    return msg;
  }
}
