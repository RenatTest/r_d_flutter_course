// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
  id: (json['id'] as num?)?.toInt(),
  locationTitle: json['location_title'] as String?,
  locationType: json['location_type'] as String?,
  startedAt: json['started_at'] == null
      ? null
      : DateTime.parse(json['started_at'] as String),
  finishedAt: json['finished_at'],
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  alertType: json['alert_type'] as String?,
  locationOblast: json['location_oblast'] as String?,
  locationUid: json['location_uid'] as String?,
  notes: json['notes'],
  country: json['country'],
  deletedAt: json['deleted_at'],
  calculated: json['calculated'],
  locationOblastUid: (json['location_oblast_uid'] as num?)?.toInt(),
  locationRaion: json['location_raion'] as String?,
);

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
  'id': instance.id,
  'location_title': instance.locationTitle,
  'location_type': instance.locationType,
  'started_at': instance.startedAt?.toIso8601String(),
  'finished_at': instance.finishedAt,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'alert_type': instance.alertType,
  'location_oblast': instance.locationOblast,
  'location_uid': instance.locationUid,
  'notes': instance.notes,
  'country': instance.country,
  'deleted_at': instance.deletedAt,
  'calculated': instance.calculated,
  'location_oblast_uid': instance.locationOblastUid,
  'location_raion': instance.locationRaion,
};
