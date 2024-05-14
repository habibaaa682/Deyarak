import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/api_service.dart';

class PhonenumberController {
  TextEditingController phoneController = TextEditingController();
  final ApiService apiService;

  Dio dio = Dio();

  PhonenumberController(this.apiService);

  Future<void> updatephonenumber(BuildContext context) async {
    try {
      print('this is phone number token');
      String token = GlobalSharedPreferences.getString('token');
      print(token);

      Map<String, dynamic> body = {
        "phone": phoneController.text,
      };

      final response = await apiService.patch(
          endPointPath: 'users/updateMe',
          token: GlobalSharedPreferences.getString('token'),
          data: body);

      if (response.statusCode == 200) {
        phoneController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Phone Number Updated successfully!'),
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
              content:
                  Text('Unknown error occurred during updating phone number'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error during updating phone number: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during updating phone number: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
