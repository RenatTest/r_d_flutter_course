import 'package:r_d_flutter_course/core/network/news_api_course/news_api_base.dart';
import 'package:r_d_flutter_course/env/env.dart';
import 'package:r_d_flutter_course/features/top_news/data/data_source/models/article_dto.dart';

class TopNewsDataSource {
  TopNewsDataSource({required NewsApiBase newsApi}) : _newsApi = newsApi;

  final NewsApiBase _newsApi;

  Future<List<ArticleDto>> getTopNews({String? apiKey}) async {
    final topNewsDto = await _newsApi.getTopNews(apiKey: Env.apiKey);
    return topNewsDto.articles ?? [];
  }
}
