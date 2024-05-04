part of 'apartment_cubit_cubit.dart';

sealed class ApartmentCubitState extends Equatable {
  const ApartmentCubitState();

  @override
  List<Object> get props => [];
}

final class ApartmentCubitInitial extends ApartmentCubitState {}
final class ApartmentCubitLoading extends ApartmentCubitState {}
final class ApartmentCubitFailure extends ApartmentCubitState {
  final String errMsg;

  const ApartmentCubitFailure(this.errMsg);
}

final class ApartmentCubitSuccess extends ApartmentCubitState {
  final List<HomeModel> homeProperties;

  const ApartmentCubitSuccess (this.homeProperties);
}