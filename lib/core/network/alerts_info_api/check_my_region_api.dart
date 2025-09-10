import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/data_source/models/check_my_region_dto/check_my_region_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'check_my_region_api.g.dart';

@RestApi(baseUrl: 'https://api.alerts.in.ua')
abstract class CheckMyRegionApiImpl implements CheckMyRegionApi {
  factory CheckMyRegionApiImpl(Dio dio, {String? baseUrl}) =
      _CheckMyRegionApiImpl;

  @override
  @GET('/v1/alerts/active.json')
  Future<CheckMyRegionDto> getRegionsAlerts({
    @Query('token') String? token = const String.fromEnvironment('TOKEN'),
  });
}

abstract interface class CheckMyRegionApi {
  Future<CheckMyRegionDto> getRegionsAlerts();
}
