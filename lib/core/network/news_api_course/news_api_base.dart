import 'package:r_d_flutter_course/features/top_news/data/data_source/models/top_news_dto.dart';

abstract interface class NewsApiBase {
  Future<TopNewsDto> getTopNews({required String apiKey});
}
