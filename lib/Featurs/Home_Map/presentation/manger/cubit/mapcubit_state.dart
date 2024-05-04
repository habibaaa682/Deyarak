part of 'mapcubit_cubit.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapcubitInitial extends MapState {}

final class MapcubitLoading extends MapState {}

final class MapcubitFailure extends MapState {
  final String errMsg;

  const MapcubitFailure(this.errMsg);
}

final class MapcubitSuccess extends MapState {
  final List<Mymapmodel> map;

  const MapcubitSuccess(this.map);
}
