import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/repository/entities/active_alerts_regions_entity.dart';

class ActiveAlertsRegionsState {
  const ActiveAlertsRegionsState({
    this.status = ActiveAlertsRegionsStatus.initial,
    this.activeAlertsRegions,
    this.errorMessage,
  });

  const ActiveAlertsRegionsState.initial()
    : status = ActiveAlertsRegionsStatus.loading,
      activeAlertsRegions = null,
      errorMessage = null;

  final ActiveAlertsRegionsStatus status;
  final ActiveAlertsRegionsEntity? activeAlertsRegions;
  final String? errorMessage;

  ActiveAlertsRegionsState copyWith({
    ActiveAlertsRegionsStatus? status,
    ActiveAlertsRegionsEntity? activeAlertsRegions,
    String? errorMessage,
  }) {
    return ActiveAlertsRegionsState(
      status: status ?? this.status,
      activeAlertsRegions: activeAlertsRegions ?? this.activeAlertsRegions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum ActiveAlertsRegionsStatus { initial, loading, loaded, error }
