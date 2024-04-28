import 'package:dio/dio.dart';

class ApiEndpoint {
  static final String baseUrl = 'https://deyarak-app.onrender.com/';
  static _AuthEndPoints authEndPoint = _AuthEndPoints();
  final Dio dio;

  ApiEndpoint(this.dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}

class _AuthEndPoints {
  final String registerEmail = 'api/v1/users/signup';
  final String loginEmail = 'api/v1/users/login';
}
