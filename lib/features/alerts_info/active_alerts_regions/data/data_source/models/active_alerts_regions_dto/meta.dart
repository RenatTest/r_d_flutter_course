import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  Meta({this.lastUpdatedAt, this.type});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  @JsonKey(name: 'last_updated_at')
  String? lastUpdatedAt;
  String? type;

  @override
  String toString() => 'Meta(lastUpdatedAt: $lastUpdatedAt, type: $type)';

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
