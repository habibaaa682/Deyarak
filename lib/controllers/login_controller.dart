import 'dart:convert';

import 'package:deyarakapp/Featurs/Home/presentation/views/Home_View.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.loginEmail);
      Map body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == "success") {
          var token = json['token'];
          print('before');
          print(token);
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);

          emailController.clear();
          passwordController.clear();
          print('login successfully');
          //GoRouter.of(context).push(AppRouter.khome);
        } else {
          throw jsonDecode(response.body)['message'] ?? 'unknown error occured';
        }
      } else if (response.statusCode == 400) {
        throw 'Missing or invalid parameters.';
      } else if (response.statusCode == 401) {
        throw 'Unauthorized. Invalid email or password.';
      } else if (response.statusCode == 500) {
        throw 'Internal server error';
      } else {
        throw 'ana bamoot ya fakhryyy!';
      }
    } catch (e) {
      //Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
