// ignore_for_file: lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  Alert({
    this.id,
    this.locationTitle,
    this.locationType,
    this.startedAt,
    this.finishedAt,
    this.updatedAt,
    this.alertType,
    this.locationOblast,
    this.locationUid,
    this.notes,
    this.country,
    this.deletedAt,
    this.calculated,
    this.locationOblastUid,
    this.locationRaion,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
  int? id;
  @JsonKey(name: 'location_title')
  String? locationTitle;
  @JsonKey(name: 'location_type')
  String? locationType;
  @JsonKey(name: 'started_at')
  DateTime? startedAt;
  @JsonKey(name: 'finished_at')
  dynamic finishedAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'alert_type')
  String? alertType;
  @JsonKey(name: 'location_oblast')
  String? locationOblast;
  @JsonKey(name: 'location_uid')
  String? locationUid;
  dynamic notes;
  dynamic country;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  dynamic calculated;
  @JsonKey(name: 'location_oblast_uid')
  int? locationOblastUid;
  @JsonKey(name: 'location_raion')
  String? locationRaion;

  @override
  String toString() {
    return 'Alert(id: $id, locationTitle: $locationTitle, locationType: $locationType, startedAt: $startedAt, finishedAt: $finishedAt, updatedAt: $updatedAt, alertType: $alertType, locationOblast: $locationOblast, locationUid: $locationUid, notes: $notes, country: $country, deletedAt: $deletedAt, calculated: $calculated, locationOblastUid: $locationOblastUid, locationRaion: $locationRaion)';
  }

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}
