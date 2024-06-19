import 'package:equatable/equatable.dart';

import 'photo.dart';

class Profile extends Equatable {
	final Photo? photo;
	final String? id;
	final String? name;
	final String? email;
	final String? phone;
	final String? role;
	final double? ratingsAverage;
	final int? ratingsQuantity;
	final List<dynamic>? wishlist;
	final int? v;

	const Profile({
		this.photo, 
		this.id, 
		this.name, 
		this.email, 
		this.phone, 
		this.role, 
		this.ratingsAverage, 
		this.ratingsQuantity, 
		this.wishlist, 
		this.v, 
	});

	factory Profile.fromJson(Map<String, dynamic> json) => Profile(
				photo: json['photo'] == null
						? null
						: Photo.fromJson(json['photo'] ),
				id: json['_id'] as String?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				role: json['role'] as String?,
				ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
				ratingsQuantity: json['ratingsQuantity'] as int?,
				wishlist: json['wishlist'] as List<dynamic>?,
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
				'wishlist': wishlist,
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
				wishlist,
				v,
		];
	}
}
