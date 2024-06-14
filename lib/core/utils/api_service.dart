import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ApiService {
  final baseUrl = 'https://deyarak-app.onrender.com/api/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPointPath, String token = ''}) async {
    var response = await _dio.get('$baseUrl$endPointPath',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response.data;
  }

  Future<List<dynamic>> gett(
      {required String endPointPath, String token = ''}) async {
    var response = await _dio.get('$baseUrl$endPointPath',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response.data;
  }

  Future<Response<dynamic>> post(
      {required String endPointPath,
      required String token,
      Map<String, dynamic>? data}) async {
    var response = await _dio.post('$baseUrl$endPointPath',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response;
  }

  Future<Response<dynamic>> patch({
    required String endPointPath,
    required String token,
    required Map<String, dynamic>? data,
  }) async {
    var response = await _dio.patch('$baseUrl$endPointPath',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response;
  }

  Future<Response<dynamic>> patchFormData({
    required String endPointPath,
    required String token,
    required FormData data,
    validateStatus,
  }) async {
   try {
     var response = await _dio.patch(
       '$baseUrl$endPointPath',
       data: data,
       options: Options(
         headers: {
           'Authorization': 'Bearer $token',
           'Content-Type': 'multipart/form-data', // Change content type
         },
         validateStatus: validateStatus??(status)=>status!<500,
       ),
     );
     return response;
   }catch(e){
     print(e);
     rethrow;
   }


  }

  Future<Response<dynamic>> delete({
    required String endPointPath,
    required String token,
  }) async {
    var response = await _dio.delete('$baseUrl$endPointPath',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response;
  }
}
