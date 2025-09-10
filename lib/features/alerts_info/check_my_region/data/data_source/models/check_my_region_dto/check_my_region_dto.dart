import 'package:json_annotation/json_annotation.dart';

part 'check_my_region_dto.g.dart';

@JsonSerializable()
class CheckMyRegionDto {
  const CheckMyRegionDto({required this.regionsAlerts});

  factory CheckMyRegionDto.fromString(String raw) {
    return CheckMyRegionDto(regionsAlerts: raw);
  }

  final String regionsAlerts;
}
