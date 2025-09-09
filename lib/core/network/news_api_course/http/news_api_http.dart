import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:r_d_flutter_course/core/network/news_api_course/news_api_base.dart';
import 'package:r_d_flutter_course/features/top_news/data/data_source/models/top_news_dto.dart';

class NewsApiHttp implements NewsApiBase {
  NewsApiHttp();

  static const String _apiKey = String.fromEnvironment('API_KEY');

  static const String _baseUrl = 'https://newsapi.org/v2/everything';

  @override
  Future<TopNewsDto> getTopNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=Ukraine&sortBy=popularity&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final topNewsDto = TopNewsDto.fromJson(data);
      return topNewsDto;
    }

    throw Exception('Failed to load top news ${response.statusCode}');
  }
}
