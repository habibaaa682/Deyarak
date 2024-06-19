import 'dart:convert';

import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordController {
  TextEditingController emailController = TextEditingController();

  Dio dio = Dio();

  Future<void> ForgetPassword(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.forgetPassword);
      Map body = {
        "email": emailController.text.trim(),
      };
      final response = await dio.post(url.toString(),
          data: jsonEncode(body), options: Options(headers: headers));

      if (response.statusCode == 200) {
        // print(response.data['data']['user']['_id']);
        emailController.clear();

        String userId = response.data['data']['user']['_id'];
        GlobalSharedPreferences.setString('userId', userId);
        // print('this is the token');
        //print(userId);
        //print('this is the token');
        String userToken = response.data['token'];
        GlobalSharedPreferences.setString('token', userToken);
        print(userToken);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email in successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        GoRouter.of(context).push(AppRouter.kforgetpassword);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.red,
                title: Text('Incorrect email '),
                contentPadding: EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ],
              );
            });
      }
    }
  }
}
