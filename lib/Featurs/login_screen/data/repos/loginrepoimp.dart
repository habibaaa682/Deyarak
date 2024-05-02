import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';
import 'package:deyarakapp/Featurs/login_screen/data/models/log_in_model/log_in_model.dart';
import 'package:deyarakapp/Featurs/login_screen/data/repos/loginrepo.dart';

import 'package:deyarakapp/core/utils/api_service.dart';

import 'package:dio/dio.dart';

import 'package:deyarakapp/core/Errors/Failure.dart';

class loginrepoimp implements loginrepo {
  final ApiService apiService;

  loginrepoimp(this.apiService);

  @override
  Future<Either<Failure, List<LogInModel>>> logintoapp() async {
    try {
      var data = await apiService.get(endPointPath: 'properties');
      List<LogInModel> account = [];
      for (var location in data['data']['data']) {
        account.add(LogInModel.fromJson(location));
      }
      print(account);
      return right(account);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
