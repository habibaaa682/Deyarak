import 'dart:convert';
import 'dart:ffi';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

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
  TextEditingController amentiesController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latlangController = TextEditingController();

  List<XFile>? imageFileListt = [];

  Dio dio = Dio();

  Future<void> AddingProperty(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.AddingProperty;

      List<String> amenitiesList =
          amentiesController.text.split(',').map((e) => e.trim()).toList();
      List<double> latlangList = [];
      try {
        latlangList = latlangController.text
            .split(',')
            .map((e) => double.parse(e.trim()))
            .toList();
      } catch (e) {
        print('Error parsing coordinates: $e');
        // Handle error appropriately, e.g., show a message to the user
      }
      FormData formData = FormData.fromMap({
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
        "amenities": amenitiesList,
        "address": addressController.text,
      });
      for (var file in imageFileListt!) {
        formData.files.add(MapEntry(
          "images",
          await MultipartFile.fromFile(file.path,
              filename: file.name.split('/').last,
              contentType: MediaType('image', 'jpg')),
        ));
      }

      final response = await dio.post(
        url.toString(),
        data: formData,
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
        imageFileListt!.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registered successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);

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
                  backgroundColor: Colors.red,
                  title: Text(errorMessage),
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
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  backgroundColor: Colors.red,
                  title: Text('Unknown error occurred during Adding Property'),
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
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.red,
                title:
                    Text('Error during during Adding Property: ${e.message}'),
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
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.red,
              title: Text('Error during during Adding Property: $e'),
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
