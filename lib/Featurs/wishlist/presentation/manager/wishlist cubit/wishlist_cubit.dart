import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/wishlist/data/models/wishlist_model/wishlist_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/wishlist repo/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());

  final WishlistRepo wishlistRepo;
  Future<void> getWishlist({required String userId}) async {
    emit(WishlistLoading());
    var result = await wishlistRepo.getUserWishlist(userId: userId);
    result.fold((l) {
      emit(WishlistFailure(l.errMessage));
    }, (r) {
      emit(WishlistSuccess(r));
    });
  }
}
