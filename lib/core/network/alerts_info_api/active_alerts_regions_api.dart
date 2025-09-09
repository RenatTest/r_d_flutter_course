import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/features/alerts_info/active_alerts_regions/data/data_source/models/active_alerts_regions_dto/active_alerts_regions_dto.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/fake_user_repository.dart';

abstract interface class ActiveAlertsRegionsApi {
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions();
}

class ActiveAlertsRegionsApiImpl implements ActiveAlertsRegionsApi {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));

  static const String _token = '89f7fd8b8eb24e67113b985852c3e087239724a4ab2203';

  @override
  Future<ActiveAlertsRegionsDto> getActiveAlertsRegions() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/v1/alerts/active.json',
        queryParameters: {'token': _token},
      );

      final data = response.data;

      if (data == null) {
        throw Exception(
          'Failed to load active alerts regions, ${response.statusCode}',
        );
      }

      return ActiveAlertsRegionsDto.fromJson(data);
    } catch (e) {
      throw CustomServerError(errorMessage: e.toString());
    }
  }
}
