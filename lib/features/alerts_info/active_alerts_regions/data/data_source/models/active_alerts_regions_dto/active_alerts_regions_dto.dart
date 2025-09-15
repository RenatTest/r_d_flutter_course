import 'package:json_annotation/json_annotation.dart';

import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/alert.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/meta.dart';

part 'active_alerts_regions_dto.g.dart';

@JsonSerializable()
class ActiveAlertsRegionsDto {
  ActiveAlertsRegionsDto({this.alerts, this.meta, this.disclaimer});

  factory ActiveAlertsRegionsDto.fromJson(Map<String, dynamic> json) {
    return _$ActiveAlertsRegionsDtoFromJson(json);
  }
  List<Alert>? alerts;
  Meta? meta;
  String? disclaimer;

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ActiveAlertsRegionsDto(alerts: $alerts, meta: $meta, disclaimer: $disclaimer)';
  }

  Map<String, dynamic> toJson() => _$ActiveAlertsRegionsDtoToJson(this);
}
