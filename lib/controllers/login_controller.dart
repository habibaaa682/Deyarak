import 'dart:convert';

import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/utils/router.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Dio dio = Dio();

  Future<void> loginWithEmail(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.loginEmail);
      Map body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      };
      final response = await dio.post(url.toString(),
          data: jsonEncode(body), options: Options(headers: headers));

      if (response.statusCode == 200) {
        emailController.clear();
        passwordController.clear();
        print('this is the token');
        String userToken = response.data['token'];
        GlobalSharedPreferences.setString('token', userToken);
        GlobalSharedPreferences.getString('token');
        print('this is the token');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('logged in successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        GoRouter.of(context).push(AppRouter.khome);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect email or password!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
