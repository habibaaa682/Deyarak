import 'package:bloc/bloc.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/models/mymapmodel/mymapmodel.dart';
import 'package:deyarakapp/Featurs/Home_Map/data/repos/maprepo.dart';
import 'package:equatable/equatable.dart';

part 'mapcubit_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.map) : super(MapcubitInitial());
  final maprepo map;

  Future<void> getpropritylocation() async {
    emit(MapcubitLoading());
    var result = await map.getpropritieslocations();
    result.fold((l) {
      emit(MapcubitFailure(l.errMessage));
    }, (r) {
      emit(MapcubitSuccess(r));
    });
  }
}
