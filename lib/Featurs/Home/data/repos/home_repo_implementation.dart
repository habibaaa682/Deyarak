import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_properties_model/home_properties_model.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/home_properties_repo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';
import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomePropertiesRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<HomePropertiesModel>>>
      fetchHomeProperties() async {
    try {
      print('hello');
      var data = await apiService.get(
          endPointPath:
              'properties?fields=price,size,numberOfRooms,location,images,numberOfBathrooms,address');
      List<HomePropertiesModel> homePropertiesList = [];
      for (var property in data['data']['data']) {
        homePropertiesList.add(HomePropertiesModel.fromJson(property));
      }
      print('data');
      return right(homePropertiesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
