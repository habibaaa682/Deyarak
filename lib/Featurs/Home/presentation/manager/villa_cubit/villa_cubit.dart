import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/home_model/home_model.dart';
import '../../../data/repos/home_properties_repo.dart';

part 'villa_state.dart';

class VillaCubit extends Cubit<VillaState> {
  VillaCubit(this.homePropertiesRepo) : super(VillaInitial());
  final HomePropertiesRepo homePropertiesRepo;
  Future<void> fetchVillaProperties() async {
    emit(VillaLoading());
    var result = await homePropertiesRepo.fetchHomeProperties(fields:'?category=villa');
    result.fold((failure) {
      emit(VillaFailure(failure.errMessage));
    }, (homeProperties) {
      emit(
        VillaSuccess(homeProperties),
      );
    });
  }
}
