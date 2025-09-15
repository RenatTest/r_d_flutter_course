import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/data_source/check_my_region_data_source.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/repository/entities/check_my_region_entity.dart';

abstract interface class CheckMyRegionRepository {
  Future<CheckMyRegionEntity> getRegionsAlerts();
}

class CheckMyRegionRepositoryImpl implements CheckMyRegionRepository {
  CheckMyRegionRepositoryImpl(this.dataSource);

  final CheckMyRegionDataSource dataSource;

  @override
  Future<CheckMyRegionEntity> getRegionsAlerts() async {
    final response = await dataSource.getRegionsAlerts();

    final result = CheckMyRegionEntity.fromDTO(response);

    return result;
  }
}
