import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_map_view_state.dart';

class OnMapViewCubit extends Cubit<OnMapViewState> {
  OnMapViewCubit() : super(OnMapViewInitial());
}
