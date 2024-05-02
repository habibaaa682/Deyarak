import 'dart:convert';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Dio dio = Dio();
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
      final response = await dio.post(url.toString(),
          data: jsonEncode(body), options: Options(headers: headers));
      if (response.statusCode == 201) {
        final json = jsonDecode(response.data);
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        phoneController.clear();
        print('Registered successfully');
      }
    } catch (e) {
      print('Error during registration: $e');
      if (e is DioError) {
        print('DioError response: ${e.response}');
        print('DioError message: ${e.message}');
      }
    }
  }
}
