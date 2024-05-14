import 'package:equatable/equatable.dart';

import 'data.dart';

class PropertyModell extends Equatable {
  final Data? data;

  const PropertyModell({this.data});

  factory PropertyModell.fromJson(Map<String, dynamic> json) {
    return PropertyModell(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [data];
}
