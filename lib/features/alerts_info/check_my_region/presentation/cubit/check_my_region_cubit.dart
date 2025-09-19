import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/core/constants/regions.dart';
import 'package:r_d_flutter_course/core/storage/prefs_storage/prefs_storage.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/repository/check_my_region_repository.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/presentation/cubit/check_my_region_state.dart';

class CheckMyRegionCubit extends Cubit<CheckMyRegionState> {
  CheckMyRegionCubit(this.prefs, this._repository)
    : super(CheckMyRegionState.initial());

  final PrefsStorage prefs;
  final CheckMyRegionRepository _repository;

  Future<void> init() async {
    final savedRegion = await prefs.getSelectedRegion();
    final savedIndex = await prefs.getSelectedRegionIndex();

    emit(CheckMyRegionState.initial(region: savedRegion, index: savedIndex));
  }

  void selectRegion(String region) {
    final index = regions.indexOf(region);

    prefs.setSelectedRegion(region, index + 1);

    emit(
      state.copyWith(
        status: CheckMyRegionStatus.loading,
        selectedRegion: region,
        selectedIndex: index + 1,
      ),
    );

    getRegionsAlerts(index);
  }

  Future<void> getRegionsAlerts(int index) async {
    emit(state.copyWith(status: CheckMyRegionStatus.loading));
    try {
      final regionsAlerts = await _repository.getRegionsAlerts();

      emit(
        state.copyWith(
          status: CheckMyRegionStatus.loaded,
          regionsAlerts: regionsAlerts,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CheckMyRegionStatus.error,
          errorMessage: e.toString(),
        ),
      );

      rethrow;
    }
  }
}
