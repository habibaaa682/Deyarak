import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';
import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_details_rebo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/property_model/property_model.dart';

part 'property_detailes_state.dart';

class PropertyDetailesCubit extends Cubit<PropertyDetailesState> {
  PropertyDetailesCubit(this.propertyDetailsRepo)
      : super(PropertyDetailesInitial());

  final PropertyDetailsRepo propertyDetailsRepo;
  Future<void> getPropertyDetailes({required String propertyId}) async {
    emit(PropertyDetailesLoading());
    var result =
        await propertyDetailsRepo.getCertainProperty(propertyId: propertyId);
    result.fold((l) {
      emit(PropertyDetailesFailure(l.errMessage));
    }, (r) {
      emit(PropertyDetailesSuccess(r));
    });
  }
}
