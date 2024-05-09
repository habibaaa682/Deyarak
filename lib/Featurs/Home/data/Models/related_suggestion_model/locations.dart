import 'package:equatable/equatable.dart';

class Locations extends Equatable {
  final String? type;
  final List<double>? coordinates;
  final String? address;
  final String? description;

  const Locations({
    this.type,
    this.coordinates,
    this.address,
    this.description,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        type: json['type'] as String?,
        coordinates:  (json['coordinates'] as List<dynamic>?)?.cast<double>(),
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
