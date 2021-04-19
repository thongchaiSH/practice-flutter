import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

void main() {
  Future<void> getData() async {
    String API_KEY = "fd8be3214f1fbc7b14ad5ba55467fa30";
    try {
      http.Response req = await http
          .get("http://api.exchangeratesapi.io/v1/latest?access_key=$API_KEY");

      print(req.statusCode);
      var result = jsonDecode(req.body);
      print(result);
    } catch (error) {
      print(error.message);
    }
  }

  getData();
}
