import 'package:equatable/equatable.dart';

class Mappmodel extends Equatable {
  final String? type;
  final List<double>? coordinates;
  final String? address;
  final String? description;
  final int? price;

  const Mappmodel({
    this.type,
    this.coordinates,
    this.address,
    this.description,
    this.price,
  });

  factory Mappmodel.fromJson(Map<String, dynamic> json) => Mappmodel(
        type: json['type'] as String?,
        coordinates: (json['coordinates'] as List<dynamic>?)?.cast<double>(),
        address: json['address'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates,
        'address': address,
        'description': description,
        'price': price,
      };

  @override
  List<Object?> get props {
    return [
      type,
      coordinates,
      address,
      description,
      price,
    ];
  }
}
