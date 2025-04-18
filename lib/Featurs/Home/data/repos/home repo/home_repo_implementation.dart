import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';

import 'package:deyarakapp/Featurs/Home/data/repos/home%20repo/home_properties_repo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';
import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeRepoImpl implements HomePropertiesRepo {
  final ApiService apiService;
  TextEditingController address = TextEditingController();

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<HomeModel>>> fetchHomeProperties(
      {String fields = ''}) async {
    try {
      print('hello');
      var data = await apiService.get(endPointPath: 'properties$fields');
      List<HomeModel> homePropertiesList = [];
      for (var property in data['data']['data']) {
        homePropertiesList.add(HomeModel.fromJson(property));
      }
      // print(homePropertiesList[1].price);
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
