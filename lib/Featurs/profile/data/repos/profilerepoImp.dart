import 'package:dartz/dartz.dart';

import 'package:deyarakapp/Featurs/profile/data/models/user/user.profile.dart';
import 'package:deyarakapp/Featurs/profile/data/repos/profilerepo.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';

import 'package:deyarakapp/core/utils/api_service.dart';

import 'package:dio/dio.dart';

import '../../../../controllers/sharedPrefrenceController.dart';

class profilerepimp implements profilerepo {
  final ApiService apiService;

  profilerepimp(this.apiService);

  @override
  Future<Either<Failure, List<User>>> getuserprofile() async {
    try {
      print('token from userdata end point');

      String token = GlobalSharedPreferences.getString('token');
      print(token);
      var response =
          await apiService.get(endPointPath: 'users/me', token: token);
      var userData;
      if (response['status'] == 'success') {
        userData = User.fromJson(response['data']['data']);
        print(userData);
      } else {
        return left(ServerFailure('failed to fetch user data'));
      }

      return right([userData!]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
