import 'package:equatable/equatable.dart';

class Photo extends Equatable {
	final String? url;
	final dynamic publicId;

	const Photo({this.url, this.publicId});

	factory Photo.fromJson(Map<String, dynamic> json) => Photo(
				url: json['url'] as String?,
				publicId: json['publicId'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
				'publicId': publicId,
			};

	@override
	List<Object?> get props => [url, publicId];
}
