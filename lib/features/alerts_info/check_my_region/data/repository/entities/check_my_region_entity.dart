import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/data_source/models/check_my_region_dto/check_my_region_dto.dart';

class CheckMyRegionEntity {
  const CheckMyRegionEntity({required this.regionsAlerts});

  factory CheckMyRegionEntity.fromDTO(CheckMyRegionDto dto) {
    return CheckMyRegionEntity(regionsAlerts: dto.regionsAlerts);
  }

  final String? regionsAlerts;
}
