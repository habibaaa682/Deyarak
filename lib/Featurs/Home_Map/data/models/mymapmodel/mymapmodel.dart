import 'package:equatable/equatable.dart';

import 'locations.dart';

class Mymapmodel extends Equatable {
	final Locations? locations;
	final int? price;

	const Mymapmodel({this.locations, this.price});

	factory Mymapmodel.fromJson(Map<String, dynamic> json) => Mymapmodel(
				locations: json['locations'] == null
						? null
						: Locations.fromJson(json['locations'] as Map<String, dynamic>),
				price: json['price'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'locations': locations?.toJson(),
				'price': price,
			};

	@override
	List<Object?> get props => [locations, price];
}
