import 'package:dartz/dartz.dart';
import 'package:deyarakapp/Featurs/wishlist/data/models/wishlist_model/wishlist_model.dart';

import '../../../../../core/Errors/Failure.dart';

abstract class WishlistRepo {
  Future<Either<Failure, List<WishlistModel>>> getUserWishlist(
      {required String userId});
}
