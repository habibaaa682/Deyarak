import 'package:dio/dio.dart';

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

  Future<Response<dynamic>> post(
      {required String endPointPath, required String token}) async {
    var response = await _dio.post('$baseUrl$endPointPath',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ));
    return response;
  }
}
