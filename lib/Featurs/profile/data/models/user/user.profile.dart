import 'package:equatable/equatable.dart';

import 'photo.profile.dart';

class User extends Equatable {
  final Photo? photo;
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final int? v;

  const User({
    this.photo,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: json['photo'] == null
            ? null
            : Photo.fromJson(json['photo'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
        ratingsQuantity: json['ratingsQuantity'] as int?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'photo': photo?.toJson(),
        '_id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        'ratingsAverage': ratingsAverage,
        'ratingsQuantity': ratingsQuantity,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      photo,
      id,
      name,
      email,
      phone,
      role,
      ratingsAverage,
      ratingsQuantity,
      v,
    ];
  }
}
