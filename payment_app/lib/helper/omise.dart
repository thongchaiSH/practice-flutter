import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Omise {
  final String name;
  final String number;
  final String expMonth;
  final String expYear;
  final String security;
  final String price;

  Omise(
      {this.name,
      this.number,
      this.expMonth,
      this.expYear,
      this.security,
      this.price});

  String token;
  String status;

  Future<String> getToken() async {
    // thongchai, 4242424242424242, 12, 2022, 123, 100000]
    print([
      this.name,
      this.number,
      this.expMonth,
      this.expYear,
      this.security,
      this.price
    ]);

    var codec = latin1.fuse(base64);
    var specialKey = codec.encode("pkey_test_5nkhcbnwzjcu08ale9q"); //Public key
    try {
      http.Response response =
          await http.post("https://vault.omise.co/tokens", headers: {
        HttpHeaders.authorizationHeader: "Basic $specialKey"
      }, body: {
        "card[name]": this.name,
        "card[number]": this.number,
        "card[expiration_month]": this.expMonth,
        "card[expiration_year]": this.expYear,
        "card[security_code]": this.security
      });

      var responseJson = json.decode(response.body);
      this.token = responseJson['id'];
      print(responseJson);
      if (token == null) {
        throw responseJson['message'];
      }
      return token;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<String> cardCharge() async {
    var codec = latin1.fuse(base64);
    var specialKey = codec.encode("skey_test_5nkhcbnx7h52h1wvv3o"); //Secret key

    try {
      http.Response response = await http.post(
        "https://api.omise.co/charges",
        headers: {HttpHeaders.authorizationHeader: "Basic $specialKey"},
        body: {"amount": this.price, "currency": "thb", "card": this.token},
      );
      var responseJson = json.decode(response.body);
      this.status = responseJson['status'];
      print("Status : $status");
      if (status != "successful") {
        throw responseJson['message'];
      }
      return this.status;
    } catch (e) {
      throw e;
    }
  }
}
