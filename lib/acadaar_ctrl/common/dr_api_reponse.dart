import 'dart:convert';

import 'package:http/http.dart';

class DrApiResponse {
  DrApiResponse(Response response) {
    code = response.statusCode;

    if (isSuccessful()) {
      body = response.body;
      final dynamic hashMap = json.decode(response.body);
      print(hashMap['message']);
      successMessage = hashMap['message'];
    } else {
      body = response.body;
      final dynamic hashMap = json.decode(response.body);
      print(hashMap['message']);
      errorMessage = hashMap['message'];
    }
  }

  int code;
  String body;
  String errorMessage;
  String successMessage;

  bool isSuccessful() {
    return code >= 200 && code < 300;
  }
}
