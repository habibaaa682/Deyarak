import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/home_model/home_model.dart';
import '../../../data/repos/home repo/home_properties_repo.dart';

part 'furnitured_apartment_state.dart';

class FurnituredApartmentCubit extends Cubit<FurnituredApartmentState> {
  FurnituredApartmentCubit(this.homePropertiesRepo)
      : super(FurnituredApartmentInitial());
  final HomePropertiesRepo homePropertiesRepo;
  Future<void> fetchFurnituredProperties() async {
    emit(FurnituredApartmentLoading());
    var result = await homePropertiesRepo.fetchHomeProperties(
        fields: '?category=furnished apartment');
    result.fold((failure) {
      emit(FurnituredApartmentFailure(failure.errMessage));
    }, (homeProperties) {
      emit(
        FurnituredApartmentSuccess(homeProperties),
      );
    });
  }
}
