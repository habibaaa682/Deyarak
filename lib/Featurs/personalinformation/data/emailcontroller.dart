import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/api_service.dart';



class EmailController {
  TextEditingController emailController = TextEditingController();
  final ApiService apiService;

  Dio dio = Dio();

  EmailController( this.apiService);

  Future<void> updateEmail(BuildContext context) async {
    try {
      print('this is Email token');
      String token = GlobalSharedPreferences.getString('token');
      print(token);

      Map <String,dynamic> body = {
        "name": emailController.text,
        "role": "user"
      };

      final response = await apiService.patch(
          endPointPath: 'users/updateMe',
          token:  GlobalSharedPreferences.getString(
              'token'),
          data: body);

      if (response.statusCode == 201) {
        emailController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email Updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        GoRouter.of(context).pop();


      }
    } on DioError catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        if (errorData.containsKey('message')) {
          final errorMessage = errorData['message'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Unknown error occurred during updating Email'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error during updating Email: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during updating Email: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
