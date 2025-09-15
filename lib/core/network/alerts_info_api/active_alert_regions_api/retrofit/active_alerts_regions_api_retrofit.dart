import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/core/network/alerts_info_api/active_alert_regions_api/dio/active_alerts_regions_api.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/active_alerts_regions_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'active_alerts_regions_api_retrofit.g.dart';

@RestApi(baseUrl: 'https://api.alerts.in.ua')
abstract class ActiveAlertsRegionsApiImplRetrofit
    implements ActiveAlertsRegionsApi {
  factory ActiveAlertsRegionsApiImplRetrofit(Dio dio, {String? baseUrl}) =
      _ActiveAlertsRegionsApiImplRetrofit;

  @override
  @GET('/v1/alerts/active.json')
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions({
    @Query('apiKey') required String token,
  });
}
