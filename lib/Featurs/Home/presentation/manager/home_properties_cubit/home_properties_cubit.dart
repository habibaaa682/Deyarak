import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/home_model/home_model.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/home%20repo/home_properties_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_properties_state.dart';

class HomePropertiesCubit extends Cubit<HomePropertiesState> {
  HomePropertiesCubit(this.homePropertiesRepo) : super(HomePropertiesInitial());
  final HomePropertiesRepo homePropertiesRepo;

  Future<void> fetchHomeProperties({String fields = ''}) async {
    emit(HomePropertiesLoading());
    var result = await homePropertiesRepo.fetchHomeProperties(fields: fields);
    result.fold((failure) {
      emit(HomePropertiesFailure(failure.errMessage));
    }, (homeProperties) {
      if (fields.toLowerCase().contains('address')) {
        emit(SearchPropertiesSuccess(homeProperties));
      } else {
        emit(AllHomePropertiesSuccess(homeProperties));
      }
    });
  }
}
/*lse if(fields.toLowerCase().contains('address')) {
ApartmentPropertiesSuccess(homeProperties);
}*/
