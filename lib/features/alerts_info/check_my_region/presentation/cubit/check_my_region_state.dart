import 'package:r_d_flutter_course/core/constants/regions.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/repository/entities/check_my_region_entity.dart';

class CheckMyRegionState {
  const CheckMyRegionState({
    this.status = CheckMyRegionStatus.initial,
    this.regionsAlerts,
    this.selectedRegion,
    this.selectedIndex,
    this.errorMessage,
  });

  CheckMyRegionState.initial()
    : status = CheckMyRegionStatus.loading,
      selectedRegion = regions[0],
      selectedIndex = 1,
      regionsAlerts = null,
      errorMessage = null;

  final CheckMyRegionStatus status;
  final CheckMyRegionEntity? regionsAlerts;
  final String? selectedRegion;
  final int? selectedIndex;
  final String? errorMessage;

  CheckMyRegionState copyWith({
    CheckMyRegionStatus? status,
    CheckMyRegionEntity? regionsAlerts,
    String? selectedRegion,
    int? selectedIndex,
    String? errorMessage,
  }) {
    return CheckMyRegionState(
      status: status ?? this.status,
      regionsAlerts: regionsAlerts ?? this.regionsAlerts,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum CheckMyRegionStatus { initial, loading, loaded, error }
