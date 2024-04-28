part of 'home_properties_cubit.dart';

sealed class HomePropertiesState extends Equatable {
  const HomePropertiesState();

  @override
  List<Object> get props => [];
}

final class HomePropertiesInitial extends HomePropertiesState {}

final class HomePropertiesLoading extends HomePropertiesState {}

final class HomePropertiesFailure extends HomePropertiesState {
  final String errMsg;

  const HomePropertiesFailure(this.errMsg);
}

final class HomePropertiesSuccess extends HomePropertiesState {
  final List<HomePropertiesModel> homeProperties;

  const HomePropertiesSuccess(this.homeProperties);
}
