// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_alerts_regions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveAlertsRegionsDto _$ActiveAlertsRegionsDtoFromJson(
  Map<String, dynamic> json,
) => ActiveAlertsRegionsDto(
  alerts: (json['alerts'] as List<dynamic>?)
      ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  disclaimer: json['disclaimer'] as String?,
);

Map<String, dynamic> _$ActiveAlertsRegionsDtoToJson(
  ActiveAlertsRegionsDto instance,
) => <String, dynamic>{
  'alerts': instance.alerts,
  'meta': instance.meta,
  'disclaimer': instance.disclaimer,
};
