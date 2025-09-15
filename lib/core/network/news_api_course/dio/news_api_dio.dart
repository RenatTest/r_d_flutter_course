// ignore_for_file: strict_raw_type, avoid_print, lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:r_d_flutter_course/core/network/news_api_course/news_api_base.dart';
import 'package:r_d_flutter_course/features/top_news/data/data_source/models/top_news_dto.dart';

class NewsApiDio implements NewsApiBase {
  NewsApiDio();

  final Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org'));
  // ..interceptors.add(PrettyDioLogger(enabled: kDebugMode))
  // ..interceptors.add(
  //   InterceptorsWrapper(
  //     onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
  //       print('Request: ${options.uri}');
  //       return handler.next(options);
  //     },
  //     onResponse: (Response response, ResponseInterceptorHandler handler) {
  //       print('Response: ${response.data}');
  //       return handler.next(response);
  //     },
  //     onError: (DioException error, ErrorInterceptorHandler handler) {
  //       print('Error: ${error.response?.data}');
  //       return handler.next(error);
  //     },
  //   ),
  // );

  @override
  Future<TopNewsDto> getTopNews({String? apiKey}) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v2/everything',
      queryParameters: {
        'q': 'Ukraine',
        'sortBy': 'popularity',
        'apiKey': apiKey,
      },
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Failed to load top news, ${response.statusCode}');
    }

    return TopNewsDto.fromJson(data);
  }
}
