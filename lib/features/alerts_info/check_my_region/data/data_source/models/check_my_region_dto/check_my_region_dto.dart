class CheckMyRegionDto {
  const CheckMyRegionDto({required this.regionsAlerts});

  factory CheckMyRegionDto.fromString(String regionsAlertsData) {
    return CheckMyRegionDto(regionsAlerts: regionsAlertsData);
  }

  final String regionsAlerts;
}
