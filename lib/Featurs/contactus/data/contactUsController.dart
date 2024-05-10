import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/api_service.dart';



class contactUsController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageTitleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final ApiService apiService;
  Dio dio = Dio();

  contactUsController( this.apiService);

  Future<void> contactUsMessage(BuildContext context) async {

    try {
      print('this is contact us token');
      String token = GlobalSharedPreferences.getString('token');
      print(token);
      Map<String,dynamic> body = {
        "name": nameController.text,
        "phone": phoneController.text,
        "messageTitle":messageTitleController.text,
        "message":messageController.text,

      };


      final response = await apiService.post(
          endPointPath: 'contacts/contactus',
          token:  GlobalSharedPreferences.getString(
              'token'),
      data: body);





       print(response);
      if (response.statusCode == 201) {
        nameController.clear();
        phoneController.clear();
        messageTitleController.clear();
        messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Message sent successfully!'),
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
              content: Text(e.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during sending message: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
