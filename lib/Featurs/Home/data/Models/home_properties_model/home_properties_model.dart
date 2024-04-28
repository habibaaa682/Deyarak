import 'package:equatable/equatable.dart';

import 'image.dart';

class HomePropertiesModel extends Equatable {
  final String? id;
  final List<Image>? images;
  final int? price;
  final int? size;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final String? address;
  final int? totalRooms;
  final String? id2;

  const HomePropertiesModel({
    this.id,
    this.images,
    this.price,
    this.size,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.address,
    this.totalRooms,
    this.id2,
  });

  factory HomePropertiesModel.fromJson(Map<String, dynamic> json) {
    return HomePropertiesModel(
      id: json['_id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
      size: json['size'] as int?,
      numberOfRooms: json['numberOfRooms'] as int?,
      numberOfBathrooms: json['numberOfBathrooms'] as int?,
      address: json['address'] as String?,
      totalRooms: json['totalRooms'] as int?,
      id2: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'price': price,
        'size': size,
        'numberOfRooms': numberOfRooms,
        'numberOfBathrooms': numberOfBathrooms,
        'address': address,
        'totalRooms': totalRooms,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      id,
      images,
      price,
      size,
      numberOfRooms,
      numberOfBathrooms,
      address,
      totalRooms,
      id,
    ];
  }
}
