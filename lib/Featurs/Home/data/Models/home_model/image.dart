import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? url;
  final String? publicId;
  final String? id;
  final String? id2;

  const Image({this.url, this.publicId, this.id, this.id2});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'] as String?,
        publicId: json['public_id'] as String?,
        id: json['_id'] as String?,
        id2: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'public_id': publicId,
        '_id': id,
        'id': id,
      };

  @override
  List<Object?> get props => [url, publicId, id, id];
}
