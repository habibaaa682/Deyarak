part of 'property_detailes_cubit.dart';

sealed class PropertyDetailesState extends Equatable {
  const PropertyDetailesState();

  @override
  List<Object> get props => [];
}

final class PropertyDetailesInitial extends PropertyDetailesState {}

final class PropertyDetailesLoading extends PropertyDetailesState {}

final class PropertyDetailesSuccess extends PropertyDetailesState {
  final List<PropertyModel> propertydetailes;

  const PropertyDetailesSuccess(this.propertydetailes);
}

final class PropertyDetailesFailure extends PropertyDetailesState {
  final String errMsg;

  const PropertyDetailesFailure(this.errMsg);
}
