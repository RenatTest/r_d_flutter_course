import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/features/alerts_info/check_my_region/data/data_source/models/check_my_region_dto/check_my_region_dto.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/fake_user_repository.dart';

abstract interface class CheckMyRegionApi {
  Future<CheckMyRegionDto> getRegionsAlerts();
}

class CheckMyRegionApiImpl implements CheckMyRegionApi {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));

  static const String _token = String.fromEnvironment('TOKEN');

  @override
  Future<CheckMyRegionDto> getRegionsAlerts() async {
    try {
      final response = await dio.get<String>(
        '/v1/iot/active_air_raid_alerts_by_oblast.json',
        queryParameters: {'token': _token},
      );

      final data = response.data;

      if (data == null) {
        throw Exception(
          'Failed to load active alerts regions, ${response.statusCode}',
        );
      }

      return CheckMyRegionDto.fromString(data);
    } catch (e) {
      throw CustomServerError(errorMessage: e.toString());
    }
  }
}
