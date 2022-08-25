import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../textfield_controler.dart';

class LoginApi {
  static TextEditingController email = AppTextFieldControler.loginEmail;
  static TextEditingController password = AppTextFieldControler.loginPassword;

  static Future<int> loginApi() async {
    try {
      String url = 'https://inveoa.com/api/login';
      final response = await http.post(Uri.parse(url), body: {
        "email": email.text,
        "password": password.text,
      });
      print(response.body);
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      if (e is SocketException) {
        return 501;
      }
      if (e is TimeoutException) {
        return 77;
      }
      print(e.toString());
      return 501;
    }
    ;
  }
}
