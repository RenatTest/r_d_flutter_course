import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/repository/active_alerts_regions_repository.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/presentation/cubit/active_alerts_regions_state.dart';

class ActiveAlertsRegionsCubit extends Cubit<ActiveAlertsRegionsState> {
  ActiveAlertsRegionsCubit(this._repository)
    : super(const ActiveAlertsRegionsState.initial());

  final ActiveAlertsRegionsRepository _repository;

  Future<void> getActiveAlertsRegions() async {
    emit(state.copyWith(status: ActiveAlertsRegionsStatus.loading));
    try {
      final activeAlertsRegions = await _repository.getActiveAlertsRegions();

      emit(
        state.copyWith(
          status: ActiveAlertsRegionsStatus.loaded,
          activeAlertsRegions: activeAlertsRegions,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ActiveAlertsRegionsStatus.error,
          errorMessage: e.toString(),
        ),
      );

      rethrow;
    }
  }
}
