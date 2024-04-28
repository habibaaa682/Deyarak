import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://deyarak-app.onrender.com/api/v1/';
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPointPath}) async {
    var response = await _dio.get('$baseUrl$endPointPath');
    return response.data;
  }
}
