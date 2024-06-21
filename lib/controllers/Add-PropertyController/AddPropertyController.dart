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
  TextEditingController BuildingAgeController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController amentiesController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController langController = TextEditingController();
  TextEditingController FurnishedController = TextEditingController();
  TextEditingController FinishedController = TextEditingController();
  TextEditingController ElevatorController = TextEditingController();

  List<XFile>? imageFileListt = [];

  Dio dio = Dio();

  Future<void> AddingProperty(BuildContext context) async {
    try {
      int price;
      int size;
      double doublePrice;
      double doubleSize;
      int nOfRooms;
      int nOfBaths;
      int propertyAge;
      bool Furnished;
      bool Finished;
      bool Elevator;

      Finished = FinishedController.text == 'true';
      Furnished = FurnishedController.text == 'true';
      Elevator = ElevatorController.text == 'true';
      String token = GlobalSharedPreferences.getString('token');

      var headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token', // Include the authentication token
      };

      var url = ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.AddingProperty;

      List<String> amenitiesList = amentiesController.text.split(',').map((e) => e.trim()).toList();

      // Check for empty fields
      List<String> missingFields = [];

      if (PriceController.text.isEmpty) missingFields.add("Price");
      if (SizeController.text.isEmpty) missingFields.add("Size");
      if (NroomsController.text.isEmpty) missingFields.add("Number of Rooms");
      if (NbathroomsController.text.isEmpty) missingFields.add("Number of Bathrooms");
      if (CategoryController.text.isEmpty) missingFields.add("Category");
      if (BuildingAgeController.text.isEmpty) missingFields.add("Building Age");
      if (DescriptionController.text.isEmpty) missingFields.add("Description");
      if (latController.text.isEmpty) missingFields.add("Latitude");
      if (langController.text.isEmpty) missingFields.add("Longitude");
      if (addressController.text.isEmpty) missingFields.add("Address");

      if (missingFields.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Missing Fields'),
              content: Text('Please provide the following fields: ${missingFields.join(', ')}.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      doublePrice = double.parse(PriceController.text.toString());
      doubleSize = double.parse(SizeController.text.toString());
      nOfRooms = int.parse(NroomsController.text);
      nOfBaths = int.parse(NbathroomsController.text);
      propertyAge = int.parse(BuildingAgeController.text);
      price = doublePrice.toInt();
      size = doubleSize.toInt();

      double latitude;
      double longitude;
      try {
        latitude = double.parse(latController.text);
        longitude = double.parse(langController.text);
      } catch (e) {
        print('Error parsing coordinates: $e');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Invalid Coordinates'),
              content: Text('Invalid coordinates.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      FormData formData = FormData.fromMap({
        "price": price,
        "size": size,
        "numberOfRooms": nOfRooms,
        "numberOfBathrooms": nOfBaths,
        "category": CategoryController.text,
        "finished": Finished,
        "furnished": Furnished,
        "elevator": Elevator,
        "propertyAge": propertyAge,
        "description": DescriptionController.text,
        "amenities": amenitiesList,
        "coordinates": [latitude, longitude],
        "address": addressController.text,
        "locations": {
          "type": "Point",
          "coordinates": [latitude, longitude],
          "address": addressController.text,
        }
      });

      print('FormData fields: ${formData.fields}');
      print('FormData files: ${formData.files.map((e) => e.value.filename).toList()}');

      for (var file in imageFileListt!) {
        formData.files.add(MapEntry(
          "images",
          await MultipartFile.fromFile(
            file.path,
            filename: file.name.split('/').last,
            contentType: MediaType('image', 'jpeg'), // Ensure correct media type
          ),
        ));
      }

      final response = await dio.post(
        url,
        data: formData,
        options: Options(headers: headers),
      );

      if (response.statusCode == 201) {
        NroomsController.clear();
        NbathroomsController.clear();
        CategoryController.clear();
        BuildingAgeController.clear();
        DescriptionController.clear();
        imageFileListt!.clear();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Property Created successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Failed'),
              content: Text('Failed to create property. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final errorData = e.response!.data;
        print('DioError: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        print('Error data: $errorData');
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.blue,
              title: Text('Error: ${e.response!.statusCode}'),
              contentPadding: EdgeInsets.all(16),
              children: [
                Text('Message: ${e.response!.statusMessage}'),
                Text('Data: $errorData'),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      } else {
        print('DioError without response: $e');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          print(e.toString());
          return SimpleDialog(
            backgroundColor: Colors.red,
            title: Text('Error during Adding Property: $e'),
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
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }
  }
}
