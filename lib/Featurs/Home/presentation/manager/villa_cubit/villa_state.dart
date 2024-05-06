part of 'villa_cubit.dart';

sealed class VillaState extends Equatable {
  const VillaState();

  @override
  List<Object> get props => [];
}

final class VillaInitial extends VillaState {}
final class VillaLoading extends VillaState {}
final class VillaSuccess extends VillaState {
  final List<HomeModel> homeProperties;

  const  VillaSuccess(this.homeProperties);
}
final class VillaFailure extends VillaState {
  final String errMsg;

  const VillaFailure(this.errMsg);
}