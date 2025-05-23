import 'package:dartz/dartz.dart';

import 'package:deyarakapp/Featurs/Home_Map/data/models/mappmodel.dart';

import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';

import 'package:deyarakapp/core/utils/api_service.dart';

import 'package:dio/dio.dart';

import 'package:deyarakapp/core/Errors/Failure.dart';

import '../../../../controllers/sharedPrefrenceController.dart';

class maprepoimp implements maprepo {
  final ApiService apiService;

  maprepoimp(this.apiService);

  @override
  Future<Either<Failure, List<Mappmodel>>> getpropritieslocations() async {
    try {
      print('token from map end point');

      String token = GlobalSharedPreferences.getString('token');
      print(token);
      var data = await apiService.get(
          endPointPath: 'properties/all-locations', token: token);
      List<Mappmodel> map = [];
      for (var location in data['data']['locations']) {
        map.add(Mappmodel.fromJson(location));
      }
      print(map);
      return right(map);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
