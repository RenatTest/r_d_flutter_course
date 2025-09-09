import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/active_alerts_regions_dto.dart';

class ActiveAlertsRegionsEntity {
  const ActiveAlertsRegionsEntity({required this.activeAlertsRegionsList});

  factory ActiveAlertsRegionsEntity.fromDTO(ActiveAlertsRegionsDto dto) {
    return ActiveAlertsRegionsEntity(
      activeAlertsRegionsList: dto.alerts?.map((item) {
        return {
          'region': item.locationOblast,
          'district': item.locationTitle,
          'alertStarted': item.startedAt,
        };
      }).toList(),
    );
  }

  final List<Map<String, dynamic>>? activeAlertsRegionsList;
}
