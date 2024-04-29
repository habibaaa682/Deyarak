import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time Out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time Out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Time Out with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate , Internal Server Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection');
      default:
        return ServerFailure('Oops,There was an Error,Please try later!');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure('Status Code 400');
    } else if (statusCode == 401) {
      return ServerFailure('Status Code 401');
    } else if (statusCode == 403) {
      return ServerFailure('Status Code 403');
    } else if (statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Status Code 500');
    } else {
      return ServerFailure('There was an Error,Please try later!');
    }
  }
}
