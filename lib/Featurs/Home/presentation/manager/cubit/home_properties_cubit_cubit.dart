import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_properties_cubit_state.dart';

class HomePropertiesCubitCubit extends Cubit<HomePropertiesCubitState> {
  HomePropertiesCubitCubit() : super(HomePropertiesCubitInitial());
}
