import 'dart:convert';

import 'package:currency_app/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String url = "http://hasanadiguzel.com.tr/api/kurgetir";

  Future<CurrencyModel?> fetchCurrency() async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var jsonBody = CurrencyModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("Error Code: " + res.statusCode.toString());
    }
  }
}
