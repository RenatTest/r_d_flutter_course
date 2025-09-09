import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  Like({this.contains});

  factory Like.fromMap(Map<String, dynamic> data) =>
      Like(contains: data['contains'] as bool?);

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Like].
  factory Like.fromJson(String data) {
    return Like.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  bool? contains;

  Map<String, dynamic> toMap() => {'contains': contains};

  /// `dart:convert`
  ///
  /// Converts [Like] to a JSON string.
  String toJson() => json.encode(toMap());
}
