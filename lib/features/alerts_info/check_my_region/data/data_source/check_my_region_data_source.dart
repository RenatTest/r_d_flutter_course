import 'package:r_d_flutter_course/core/network/alerts_info_api/check_my_region_api.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/data_source/models/check_my_region_dto/check_my_region_dto.dart';

abstract interface class CheckMyRegionDataSource {
  Future<CheckMyRegionDto> getRegionsAlerts();
}

class CheckMyRegionDataSourceImpl implements CheckMyRegionDataSource {
  CheckMyRegionDataSourceImpl(this._api);

  final CheckMyRegionApi _api;

  @override
  Future<CheckMyRegionDto> getRegionsAlerts() async {
    final result = await _api.getRegionsAlerts();

    return result;
  }
}
