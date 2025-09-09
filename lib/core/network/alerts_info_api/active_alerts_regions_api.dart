import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/active_alerts_regions_dto.dart';

abstract interface class ActiveAlertsRegionsApi {
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions();
}

class ActiveAlertsRegionsApiImpl implements ActiveAlertsRegionsApi {
  ActiveAlertsRegionsApiImpl();

  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));

  static const String _token = '89f7fd8b8eb24e67113b985852c3e087239724a4ab2203';

  @override
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions() async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/alerts/active.json',
      queryParameters: {'token': _token},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Failed to load top news, ${response.statusCode}');
    }
    print(data);

    return ActiveAlertsRegionsDto.fromJson(data);
  }
}
