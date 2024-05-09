part of 'furnitured_apartment_cubit.dart';

sealed class FurnituredApartmentState extends Equatable {
  const FurnituredApartmentState();

  @override
  List<Object> get props => [];
}

final class FurnituredApartmentInitial extends FurnituredApartmentState {}

final class FurnituredApartmentLoading extends FurnituredApartmentState {}

final class FurnituredApartmentSuccess extends FurnituredApartmentState {
  final List<HomeModel> homeProperties;

  const FurnituredApartmentSuccess(this.homeProperties);
}

final class FurnituredApartmentFailure extends FurnituredApartmentState {
  final String errMsg;

  const FurnituredApartmentFailure(this.errMsg);
}
