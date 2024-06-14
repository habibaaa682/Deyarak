import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/profile/data/models/profile/profile.dart';

import 'package:deyarakapp/Featurs/profile/data/repos/profilerepo.dart';
import 'package:equatable/equatable.dart';

part 'userprofile_state.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  UserprofileCubit(this.profile) : super(UserprofileInitial());
  final profilerepo profile;
  Future<void> getUserprofile() async {
    emit(UserprofileLoading());
    var result = await profile.getuserprofile();
    result.fold((l) {
      emit(UserprofileFailure(l.errMessage));
    }, (r) {
      emit(UserprofileSuccess(r));
    });
  }
}
