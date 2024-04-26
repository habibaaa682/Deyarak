import 'dart:convert';

import 'package:deyarakapp/Featurs/Home/presentation/views/Home_View.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.registerEmail);
      Map body = {
        "name": nameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "passwordConfirm": passwordConfirmController.text,
        "phone": phoneController.text,
        "role": "user"
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var token = json['token'];
        print(token);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token);
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        phoneController.clear();
        // Get.to(HomeView());
        print('registered successfully');
      } else if (response.statusCode == 400) {
        throw 'Bad request. Missing or invalid parameters.';
      } else if (response.statusCode == 500) {
        throw 'Internal server error';
      } else {
        throw 'unknown error occured';
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
