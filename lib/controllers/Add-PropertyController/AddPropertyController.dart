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
  TextEditingController  FinishedController= TextEditingController();
  TextEditingController  ElevatorController= TextEditingController();

  List<XFile>? imageFileListt = [];



  Dio dio = Dio();

  Future<void> AddingProperty(BuildContext context) async {
    try {
      int price;
      int  size;
      int  nOfRooms;
      int  nOfBaths;
      int  propertyAge;
      bool  Furnished;
      bool  Finished;
      bool  Elevator;
      if(FinishedController.text=='true'){
        Finished=true;
      }else{
        Finished=false;
      }
      if(FurnishedController.text=='true'){
        Furnished=true;
      }else{
        Furnished=false;
      }
      if(ElevatorController.text=='true'){
        Elevator=true;
      }else{
        Elevator=false;
      }
      print('Furnished:${Furnished}');
      print('Finished:${Finished}');
      print('Elevator:${Elevator}');
      print('nOfBaths:${NbathroomsController.text}');
      print('nOfRooms:${NroomsController.text}');
      print('propertyAge:${BuildingAgeController.text}');
      print('category:${CategoryController.text}');
      print('Description:${DescriptionController.text}');
      print('manual address:${addressController.text}');
      print('lat:${langController.text}');
      print('lang:${latController.text}');
      print('price:${PriceController.text}');
      print('size:${SizeController.text}');
      var headers = {'Content-Type': 'application/json'};

      var url = ApiEndpoint.baseUrl + ApiEndpoint.authEndPoint.AddingProperty;

      List<String> amenitiesList =

      amentiesController.text.split(',').map((e) => e.trim()).toList();

      // price=int.parse(PriceController.text.toString());
      //size=int.parse(SizeController.text.toString());
    //  print('price:${price}');
      //print('size:${size}');
      nOfRooms=int.parse(NroomsController.text);
      nOfBaths=int.parse(NbathroomsController.text);
      propertyAge=int.parse( BuildingAgeController.text);
      print('rooms int:${nOfRooms}');
      print('baths int:${nOfBaths}');
      print('age int:${propertyAge}');

      double latitude;
      double longitude;
      try {
        latitude = double.parse(latController.text);
        longitude = double.parse(langController.text);
      } catch (e) {
        print('Error parsing coordinates: $e');
        // Handle error appropriately, e.g., show a message to the user
        return;
      }
      List<double> latlangList = [latitude,longitude];
      print(latitude);
      print(longitude);


      FormData formData = FormData.fromMap({
        "price": PriceController.text,
        "Size": SizeController.text,
        "numberOfRooms": nOfRooms,
        "numberOfBathrooms": nOfBaths,
        "category": CategoryController.text,
        "finished": Finished,
        "furnished": Furnished,
        "elevator": Elevator,
        "propertyAge": propertyAge,
        "description": DescriptionController.text,
        "amenities": amenitiesList,
        "address": addressController.text,
        "coordinates":latlangList,
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

        NroomsController.clear();
        NbathroomsController.clear();
        CategoryController.clear();
        BuildingAgeController.clear();
        DescriptionController.clear();
        imageFileListt!.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Property Created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);


      }
    } on DioError catch (e) {

      if (e.response != null) {
        final errorData = e.response!.data;

        print('DioError: $e');
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: Colors.blue,
                title: Text(e.toString()),
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
            print(e.toString());
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