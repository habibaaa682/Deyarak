import 'package:deyarakapp/Featurs/Home/data/repos/home%20repo/home_repo_implementation.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_datails_repo_impl.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_details_rebo.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/related%20suggestion%20repo/related_suggestion_repo_impl.dart';

import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepoimp.dart';
import 'package:deyarakapp/Featurs/profile/data/repos/profilerepoImp.dart';
import 'package:deyarakapp/Featurs/wishlist/data/repos/wishlist%20repo/wishlist_repo_impl.dart';
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
  getIt.registerSingleton<profilerepimp>(
    profilerepimp(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<PropertyDetailesRepoImpl>(
    PropertyDetailesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<RelatedSuggestionsRepoImpl>(
    RelatedSuggestionsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<WishlistRepoImpl>(
    WishlistRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

}
