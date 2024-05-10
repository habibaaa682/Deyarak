part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistSuccess extends WishlistState {
  final List<WishlistModel> wishlist;

  const WishlistSuccess(this.wishlist);
}

final class WishlistFailure extends WishlistState {
  final String errMsg;

  const WishlistFailure(this.errMsg);
}
