import 'package:r_d_flutter_course/features/architecture/data/data_source/news_data_source.dart';
import 'package:r_d_flutter_course/features/architecture/data/repository/entities/new_entity.dart';

abstract interface class NewsRepository {
  Future<List<NewEntity>> getNews();
}

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._dataSource);

  final NewsDataSource _dataSource;

  @override
  Future<List<NewEntity>> getNews() async {
    final response = await _dataSource.getNews();

    final result = response.map(NewEntity.fromDTO).toList();

    return result;
  }
}
