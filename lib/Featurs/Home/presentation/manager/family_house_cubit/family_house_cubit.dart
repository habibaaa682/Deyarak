import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/home_model/home_model.dart';
import '../../../data/repos/home repo/home_properties_repo.dart';

part 'family_house_state.dart';

class FamilyHouseCubit extends Cubit<FamilyHouseState> {
  FamilyHouseCubit(this.homePropertiesRepo) : super(FamilyHouseInitial());

  final HomePropertiesRepo homePropertiesRepo;
  Future<void> fetchFamilyHouseProperties() async {
    emit((FamilyHouseLoading()));
    var result = await homePropertiesRepo.fetchHomeProperties(
        fields: '?category=family house');
    result.fold((failure) {
      emit(FamilyHouseFailure(failure.errMessage));
    }, (homeProperties) {
      emit(
        FamilyHouseSuccess(homeProperties),
      );
    });
  }
}
