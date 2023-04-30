import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leqahy/model/stock_model.dart';
import 'package:leqahy/viewmodel/stocks_screen_viewmodel.dart';

class StockAPI {
  StocksScreenViewModel vm = StocksScreenViewModel();

  // Future<List<List<Stocks>>> getwithDate(String date) async {
  //   Map<String, String> headers = {
  //     'Accep': 'application/json',
  //     'Access-Control-Allow-Origin': '*'
  //   };
  //   Map<String, String> body = {'stocmarket_date': '2022-08-02'};
  //   Set<String> set = Set();
  //   List<List<Stocks>> list = [];

  //   try {
  //     var res = await http.post(Uri.parse(vm.url),
  //         headers: headers, body: jsonEncode(body));
  //     var json_dec = jsonDecode(res.body);

  //     json_dec.forEach((e) {
  //       set.add(e['stocmarket_type']);
  //     });
  //     set.forEach((element) {
  //       list.add([]);
  //     });
  //     json_dec.forEach((e) {
  //       String val = e['stocmarket_type'];
  //       switch (val) {
  //         case 'لحم':
  //           {
  //             list[0].add(Stocks.fromJson(e));
  //           }
  //           break;
  //         case 'كتاكيت':
  //           {
  //             list[1].add(Stocks.fromJson(e));
  //           }
  //           break;
  //         case 'علف':
  //           {
  //             list[2].add(Stocks.fromJson(e));
  //           }
  //           break;
  //         case 'بيض':
  //           {
  //             list[3].add(Stocks.fromJson(e));
  //           }
  //           break;
  //       }
  //     });

  //     print(list);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return list;
  // }

  Future<List<Stocks>> getwithDate(String date, String cateName) async {
    var headers = {"Content-Type": "application/json", "Accept": "/"};
    var body = jsonEncode({'category': cateName, 'date_stock': date});
    List<Stocks> list = [];

    try {
      var res =
          await http.post(Uri.parse(vm.url), headers: headers, body: body);
      if (res.statusCode == 200) {
        var jsonDec = jsonDecode(res.body);
        List<Map<String, dynamic>> listDecoded =
            List<Map<String, dynamic>>.from(jsonDec['$cateName']);
        list = listDecoded.map((e) => Stocks.fromJson(e)).toList();
      }

      return list;
    } catch (e) {
      print(e);
    }
    return list;
  }
}
