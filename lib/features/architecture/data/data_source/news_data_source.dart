import 'package:r_d_flutter_course/core/network/news_api/news_api.dart';
import 'package:r_d_flutter_course/features/architecture/data/data_source/models/new_dto.dart';

abstract interface class NewsDataSource {
  Future<List<NewDTO>> getNews();
}

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl(this._api);

  final NewsApi _api;

  @override
  Future<List<NewDTO>> getNews() async {
    final result = await _api.getNews();

    return result;
  }
}
