import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

import 'package:deyarakapp/core/utils/api_endpoints.dart';

class maprepoimp implements maprepo {
  final ApiEndpoint apiEndpoint;

  maprepoimp(this.apiEndpoint);
  @override
  Future<Either<Failure, List<Mapmodel>>> getpropritieslocations() async {
    try {
      var data =
          await apiEndpoint.get(endpoint: 'api/v1/properties/all-locations');
      List<Mapmodel> map = [];
      for (var location in data['locations']) {
        map.add(Mapmodel.fromJson(location));
      }
      return right(map);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
