import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/wishlist/data/models/wishlist_model/wishlist_model.dart';
import 'package:deyarakapp/Featurs/wishlist/data/repos/wishlist%20repo/wishlist_repo.dart';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/Errors/Failure.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';

class WishlistRepoImpl implements WishlistRepo {
  final ApiService apiService;

  WishlistRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<WishlistModel>>> getUserWishlist(
      {required String userId}) async {
    List<WishlistModel> wishlistItems;

    try {
      print('token from wishlist');
      String token = GlobalSharedPreferences.getString('token');

      var response = await apiService.get(
          endPointPath: 'users/wishlist/$userId', token: token);
      if (response['status'] == 'success') {
        Map<String, dynamic> wishlistData = response['wishlist'];
        wishlistItems = [];

        wishlistData.forEach((key, value) {
          WishlistModel item = WishlistModel.fromJson(value);
          wishlistItems.add(item);
        });

        print(wishlistItems);

    } else {
        return left(ServerFailure('failed to fetch wishlist '));
      }

      return right(wishlistItems!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
