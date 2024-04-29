import 'package:deyarakapp/Featurs/Home/data/repos/home_repo_implementation.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepoimp.dart';
import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<maprepoimp>(
    maprepoimp(
      getIt.get<ApiService>(),
    ),
  );
}
