import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';
<<<<<<< HEAD
import 'package:deyarakapp/core/errors/failure.dart';
import 'package:deyarakapp/core/utils/api_service.dart';

import 'package:dio/dio.dart';
=======
import 'package:deyarakapp/core/Errors/Failure.dart';

import 'package:deyarakapp/core/utils/api_endpoints.dart';
>>>>>>> 146c9139df60c6a8530635b0d1d0d4600523daf1

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
<<<<<<< HEAD
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
=======
      return left(ServerFailure(e.toString()));
>>>>>>> 146c9139df60c6a8530635b0d1d0d4600523daf1
    }
  }
}
