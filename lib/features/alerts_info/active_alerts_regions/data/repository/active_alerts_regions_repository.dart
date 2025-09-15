import 'package:r_d_flutter_course/env/env.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/active_alerts_regions_data_source.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/repository/entities/active_alerts_regions_entity.dart';

abstract interface class ActiveAlertsRegionsRepository {
  Future<ActiveAlertsRegionsEntity> getActiveAlertsRegions();
}

class ActiveAlertsRegionsRepositoryImpl
    implements ActiveAlertsRegionsRepository {
  ActiveAlertsRegionsRepositoryImpl(this.dataSource);

  final ActiveAlertsRegionsDataSource dataSource;

  @override
  Future<ActiveAlertsRegionsEntity> getActiveAlertsRegions() async {
    final response = await dataSource.getActiveAlertsRegions(token: Env.token);

    final result = ActiveAlertsRegionsEntity.fromDTO(response);

    return result;
  }
}
