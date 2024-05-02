import 'dart:convert';
import 'package:deyarakapp/Featurs/register_screen/register_view.dart';
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

  Future<void> registerWithEmail() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
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
      final response = await dio.post(
        url.toString(),
        data: jsonEncode(body),
        options: Options(headers: headers),
      );


      if (response.statusCode == 201) {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        phoneController.clear();
        print('Registered successfully');
        String userToken=response.data['token'];
        prefs.setString('token', userToken);
        print(prefs.getString('token'));
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }
}