import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';

import 'package:deyarakapp/core/utils/api_service.dart';

import 'package:dio/dio.dart';

import 'package:deyarakapp/core/Errors/Failure.dart';

import 'package:deyarakapp/core/utils/api_endpoints.dart';

class maprepoimp implements maprepo {
  final ApiService apiService;

  maprepoimp(this.apiService);

  @override
  Future<Either<Failure, List<Mapmodel>>> getpropritieslocations() async {
    try {
      var data =
          await apiService.get(endPointPath: 'api/v1/properties/all-locations');
      List<Mapmodel> map = [];
      for (var location in data['locations']) {
        map.add(Mapmodel.fromJson(location));
      }
      return right(map);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
