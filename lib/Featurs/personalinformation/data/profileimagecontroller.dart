import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/api_service.dart';

class ProfileimageController {
  TextEditingController imageController = TextEditingController();
  final ApiService apiService;

  Dio dio = Dio();

  ProfileimageController(this.apiService);

  Future<void> updateProfileimage(BuildContext context) async {
    try {
      String token = GlobalSharedPreferences.getString('token');
      print(token);

      Map<String, dynamic> body = {
        "photo": imageController.text,
      };

      final response = await apiService.patch(
          endPointPath: 'users/updateMe',
          token: GlobalSharedPreferences.getString('token'),
          data: body);

      if (response.statusCode == 200) {
        imageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User Name Updated successfully!'),
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
              content: Text('Unknown error occurred during updating User Name'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error during updating User Name: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during updating User Name: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
