import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/core/constants/regions.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/repository/check_my_region_repository.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/presentation/cubit/check_my_region_state.dart';

class CheckMyRegionCubit extends Cubit<CheckMyRegionState> {
  CheckMyRegionCubit(this._repository) : super(CheckMyRegionState.initial());

  final CheckMyRegionRepository _repository;

  void selectRegion(String region) {
    final index = regions.indexOf(region);
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
