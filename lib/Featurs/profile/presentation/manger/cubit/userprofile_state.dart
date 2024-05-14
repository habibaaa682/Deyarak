part of 'userprofile_cubit.dart';

sealed class UserprofileState extends Equatable {
  const UserprofileState();

  @override
  List<Object> get props => [];
}

final class UserprofileInitial extends UserprofileState {}

final class UserprofileLoading extends UserprofileState {}

final class UserprofileFailure extends UserprofileState {
  final String errMsg;

  UserprofileFailure(this.errMsg);
}

final class UserprofileSuccess extends UserprofileState {
  final List<Profile> userprofile;

  UserprofileSuccess(this.userprofile);
}
