import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../controler/textfield_controler.dart';

class PostApi {
  static TextEditingController password =
      AppTextFieldControler.passwordControler;
  static TextEditingController email = AppTextFieldControler.emailControler;
  static TextEditingController name = AppTextFieldControler.nameControerl;

  static bool index = false;

  static Future<int> postApi() async {
    try {
      const url = 'https://inveoa.com/api/signup';
      final post = await http.post(Uri.parse(url), body: {
        "email": email.text,
        "password": password.text,
        "name": name.text
      });
      print(post.body);
      if (post.statusCode == 200) {
        index = true;
        print(index);
        print(post.body);
        return post.statusCode;
      } else {
        index = false;
        print(index);
        return post.statusCode;
      }
    } on SocketException catch (e) {
      index == false;
      return 501;
    }
  }
}
