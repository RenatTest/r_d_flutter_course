import 'package:r_d_flutter_course/core/network/alerts_info_api/active_alert_regions_api/dio/active_alerts_regions_api.dart';
import 'package:r_d_flutter_course/env/env.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/active_alerts_regions_dto.dart';

abstract interface class ActiveAlertsRegionsDataSource {
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions({
    required String token,
  });
}

class ActiveAlertsRegionsDataSourceImpl
    implements ActiveAlertsRegionsDataSource {
  ActiveAlertsRegionsDataSourceImpl(this._api);

  final ActiveAlertsRegionsApi _api;

  @override
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions({String? token}) async {
    final result = await _api.getActiveAlertsRegions(token: Env.token);

    return result;
  }
}
