import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apartment_cubit_state.dart';

class ApartmentCubitCubit extends Cubit<ApartmentCubitState> {
  ApartmentCubitCubit() : super(ApartmentCubitInitial());
}
