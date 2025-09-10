import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/repository/entities/check_my_region_entity.dart';

class CheckMyRegionState {
  const CheckMyRegionState({
    this.status = CheckMyRegionStatus.initial,
    this.regionsAlerts,
    this.errorMessage,
  });

  const CheckMyRegionState.initial()
    : status = CheckMyRegionStatus.loading,
      regionsAlerts = null,
      errorMessage = null;

  final CheckMyRegionStatus status;
  final CheckMyRegionEntity? regionsAlerts;
  final String? errorMessage;

  CheckMyRegionState copyWith({
    CheckMyRegionStatus? status,
    CheckMyRegionEntity? regionsAlerts,
    String? errorMessage,
  }) {
    return CheckMyRegionState(
      status: status ?? this.status,
      regionsAlerts: regionsAlerts ?? this.regionsAlerts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum CheckMyRegionStatus { initial, loading, loaded, error }
