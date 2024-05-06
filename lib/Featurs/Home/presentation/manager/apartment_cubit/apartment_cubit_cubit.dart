import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/home_model/home_model.dart';
import '../../../data/repos/home_properties_repo.dart';

part 'apartment_cubit_state.dart';

class ApartmentCubitCubit extends Cubit<ApartmentCubitState> {
  ApartmentCubitCubit(this.homePropertiesRepo) : super(ApartmentCubitInitial());
  final HomePropertiesRepo homePropertiesRepo;
  Future<void> fetchApartmentProperties() async {
    emit(ApartmentCubitLoading());
    var result = await homePropertiesRepo.fetchHomeProperties(fields:'?category=apartment');
    result.fold((failure) {
      emit(ApartmentCubitFailure(failure.errMessage));
    }, (homeProperties) {
      emit(
        ApartmentCubitSuccess(homeProperties),
      );
    });
  }
}
