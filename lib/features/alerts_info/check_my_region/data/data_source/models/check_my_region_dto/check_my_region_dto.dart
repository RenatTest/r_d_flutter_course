import 'package:json_annotation/json_annotation.dart';

part 'check_my_region_dto.g.dart';

@JsonSerializable()
class CheckMyRegionDto {
  const CheckMyRegionDto({required this.regionsAlerts});

  final String regionsAlerts;
}
