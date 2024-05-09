import 'package:equatable/equatable.dart';

import 'image.dart';
import 'locations.dart';
import 'owner.dart';

class Data extends Equatable {
  final Locations? locations;
  final String? id;
  final List<Image>? images;
  final int? price;
  final int? size;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final String? category;
  final int? propertyAge;
  final String? slug;
  final bool? furnished;
  final bool? finished;
  final bool? elevator;
  final List<String>? amenities;
  final String? description;
  final Owner? owner;
  final int? v;
  final int? totalRooms;
  final String? id2;

  const Data({
    this.locations,
    this.id,
    this.images,
    this.price,
    this.size,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.category,
    this.propertyAge,
    this.slug,
    this.furnished,
    this.finished,
    this.elevator,
    this.amenities,
    this.description,
    this.owner,
    this.v,
    this.totalRooms,
    this.id2,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        propertyAge: json['propertyAge'] as int?,
        slug: json['slug'] as String?,
        furnished: json['furnished'] as bool?,
        finished: json['finished'] as bool?,
        elevator: json['elevator'] as bool?,
        amenities: (json['amenities'] as List<dynamic>?)?.cast<String>(),
        description: json['description'] as String?,
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
        v: json['__v'] as int?,
        totalRooms: json['totalRooms'] as int?,
        id2: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'locations': locations?.toJson(),
        '_id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'price': price,
        'size': size,
        'numberOfRooms': numberOfRooms,
        'numberOfBathrooms': numberOfBathrooms,
        'category': category,
        'propertyAge': propertyAge,
        'slug': slug,
        'furnished': furnished,
        'finished': finished,
        'elevator': elevator,
        'amenities': amenities,
        'description': description,
        'owner': owner?.toJson(),
        '__v': v,
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
      propertyAge,
      slug,
      furnished,
      finished,
      elevator,
      amenities,
      description,
      owner,
      v,
      totalRooms,
      id2,
    ];
  }
}
