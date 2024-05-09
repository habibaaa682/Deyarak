import 'package:equatable/equatable.dart';

import 'data.dart';

class PropertyModel extends Equatable {
  final Data? data;

  const PropertyModel({this.data});

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [data];
}
