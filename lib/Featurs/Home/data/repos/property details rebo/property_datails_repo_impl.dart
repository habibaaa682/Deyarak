import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_details_rebo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';
import 'package:dio/dio.dart';

import '../../../../../controllers/sharedPrefrenceController.dart';
import '../../../../../core/utils/api_service.dart';
import '../../Models/property_model/property_model.dart';

class PropertyDetailesRepoImpl implements PropertyDetailsRepo {
  final ApiService apiService;

  PropertyDetailesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<PropertyModel>>> getCertainProperty(
      {required String propertyId}) async {
    try {
      print('token from property details end point');
      String token = GlobalSharedPreferences.getString('token');

      var response = await apiService.get(
          endPointPath: 'properties/$propertyId', token: token);
      var propertyDetailes;
      if (response['status'] == 'success') {
        propertyDetailes = PropertyModel.fromJson(response['data']);
        print(propertyDetailes);
        print('property detailes data fetched');
      } else {
        return left(ServerFailure('failed to fetch property detailes '));
      }

      return right([propertyDetailes!]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
