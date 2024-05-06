part of 'family_house_cubit.dart';

sealed class FamilyHouseState extends Equatable {
  const FamilyHouseState();

  @override
  List<Object> get props => [];
}

final class FamilyHouseInitial extends FamilyHouseState {}
final class FamilyHouseLoading extends FamilyHouseState {}
final class FamilyHouseSuccess extends FamilyHouseState {
  final List<HomeModel> homeProperties;

  const FamilyHouseSuccess(this.homeProperties);
}
final class FamilyHouseFailure extends FamilyHouseState {
  final String errMsg;

  const FamilyHouseFailure(this.errMsg);
}