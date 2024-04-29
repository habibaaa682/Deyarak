import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/home_properties_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_properties_state.dart';

class HomePropertiesCubit extends Cubit<HomePropertiesState> {
  HomePropertiesCubit(this.homePropertiesRepo) : super(HomePropertiesInitial());
  final HomePropertiesRepo homePropertiesRepo;

  Future<void> fetchHomeProperties() async {
    emit(HomePropertiesLoading());
    var result = await homePropertiesRepo.fetchHomeProperties();
    result.fold((failure) {
      emit(HomePropertiesFailure(failure.errMessage));
    }, (homeProperties) {
      emit(
        HomePropertiesSuccess(homeProperties),
      );
    });
  }
}
