import 'package:equatable/equatable.dart';

class Mapmodel extends Equatable {
  final String? type;
  final List<double>? coordinates;
  final String? address;
  final String? description;

  const Mapmodel({
    this.type,
    this.coordinates,
    this.address,
    this.description,
  });

  factory Mapmodel.fromJson(Map<String, dynamic> json) => Mapmodel(
        type: json['type'] as String?,
        coordinates: json['coordinates'] as List<double>?,
        address: json['address'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates,
        'address': address,
        'description': description,
      };

  @override
  List<Object?> get props => [type, coordinates, address, description];
}
