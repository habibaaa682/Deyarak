import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/router.dart';

class RegisterationController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Dio dio = Dio();

  Future<void> registerWithEmail(BuildContext context) async {
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registered successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        GoRouter.of(context).push(AppRouter.klogin);
        String userToken = response.data['token'];
        GlobalSharedPreferences.setString('token', userToken);
        GlobalSharedPreferences.getString('token');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        if (errorData.containsKey('message')) {
          final errorMessage = errorData['message'];

          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  backgroundColor:Colors.red ,
                  title: Text(errorMessage),
                  contentPadding: EdgeInsets.all(16),
                  children: [

                    Row(
                      children: [

                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            child: Text('OK',style:TextStyle(color: Colors.white),)),
                      ],
                    ),
                  ],
                );
              });
        } else {


          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  backgroundColor:Colors.red ,
                  title: Text('Unknown error occurred during registration'),
                  contentPadding: EdgeInsets.all(16),
                  children: [

                    Row(
                      children: [

                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            child: Text('OK',style:TextStyle(color: Colors.white),)),
                      ],
                    ),
                  ],
                );
              });
        }
      } else {

        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor:Colors.red ,
                title: Text('Error during registration: ${e.message}'),
                contentPadding: EdgeInsets.all(16),
                children: [

                  Row(
                    children: [

                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: Text('OK',style:TextStyle(color: Colors.white),)),
                    ],
                  ),
                ],
              );
            });
      }
    } catch (e) {

      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor:Colors.red ,
              title: Text('Error during registration: $e'),
              contentPadding: EdgeInsets.all(16),
              children: [

                Row(
                  children: [

                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text('OK',style:TextStyle(color: Colors.white),)),
                  ],
                ),
              ],
            );
          });
    }
  }
}
