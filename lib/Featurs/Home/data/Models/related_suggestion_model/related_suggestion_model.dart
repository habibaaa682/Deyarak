import 'package:equatable/equatable.dart';

import 'image.dart';
import 'locations.dart';
import 'owner.dart';

class RelatedSuggestionModel extends Equatable {
  final Locations? locations;
  final String? id;
  final List<Image>? images;
  final int? price;
  final int? size;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final String? category;
  final String? address;
  final Owner? owner;
  final int? totalRooms;
  final String? id2;

  const RelatedSuggestionModel({
    this.locations,
    this.id,
    this.images,
    this.price,
    this.size,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.category,
    this.address,
    this.owner,
    this.totalRooms,
    this.id2,
  });

  factory RelatedSuggestionModel.fromJson(Map<String, dynamic> json) {
    return RelatedSuggestionModel(
      locations: json['locations'] == null
          ? null
          : Locations.fromJson(json['locations'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
      size: json['size'] as int?,
      numberOfRooms: json['numberOfRooms'] as int?,
      numberOfBathrooms: json['numberOfBathrooms'] as int?,
      category: json['category'] as String?,
      address: json['address'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      totalRooms: json['totalRooms'] as int?,
      id2: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'locations': locations?.toJson(),
        '_id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'price': price,
        'size': size,
        'numberOfRooms': numberOfRooms,
        'numberOfBathrooms': numberOfBathrooms,
        'category': category,
        'address': address,
        'owner': owner?.toJson(),
        'totalRooms': totalRooms,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      locations,
      id,
      images,
      price,
      size,
      numberOfRooms,
      numberOfBathrooms,
      category,
      address,
      owner,
      totalRooms,
      id2,
    ];
  }
}
