import 'package:r_d_flutter_course/features/top_news/data/data_source/top_news_data_source.dart';
import 'package:r_d_flutter_course/features/top_news/data/repository/models/article_entity.dart';

class ArticleRepository {
  ArticleRepository({required this.dataSource});

  final TopNewsDataSource dataSource;

  Future<List<ArticleEntity>> getTopNews() async {
    final articles = await dataSource.getTopNews();
    return articles.map(ArticleEntity.fromDto).toList();
  }
}
