import 'dart:convert';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class AddPropertyController {
  TextEditingController PriceController = TextEditingController();
  TextEditingController SizeController = TextEditingController();
  TextEditingController NroomsController = TextEditingController();
  TextEditingController NbathroomsController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();
  TextEditingController FinishedController = TextEditingController();
  TextEditingController FurnishedController = TextEditingController();
  TextEditingController ElevatorController = TextEditingController();
  TextEditingController BuildingAgeController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();

  Dio dio = Dio();

  Future<void> AddingProperty(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.AddingProperty);
      Map body = {
        "price": PriceController.text,
        "Size": SizeController.text,
        "numberOfRooms": NroomsController.text,
        "numberOfBathrooms": NbathroomsController.text,
        "category": CategoryController.text,
        "finished": FinishedController.text,
        "furnished": FurnishedController.text,
        "elevator": ElevatorController.text,
        "propertyAge": BuildingAgeController.text,
        "description": DescriptionController.text,

      };
      final response = await dio.post(
        url.toString(),
        data: jsonEncode(body),
        options: Options(headers: headers),
      );

      if (response.statusCode == 201) {
        PriceController.clear();
        SizeController.clear();
        NroomsController.clear();
        NbathroomsController.clear();
        CategoryController.clear();
        FinishedController.clear();
        FurnishedController.clear();
        ElevatorController.clear();
        BuildingAgeController.clear();
        DescriptionController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registered successfully!'),
            backgroundColor: Colors.green,
          ),
        );

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
                  title: Text('Unknown error occurred during Adding Property'),
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
                title: Text('Error during during Adding Property: ${e.message}'),
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
              title: Text('Error during during Adding Property: $e'),
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
