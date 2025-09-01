import 'package:get_it/get_it.dart';
import 'package:r_d_flutter_course/core/network/news_api/news_api.dart';
import 'package:r_d_flutter_course/features/architecture/data/data_source/news_data_source.dart';
import 'package:r_d_flutter_course/features/architecture/data/repository/news_repository.dart';

final getIt = GetIt.instance;

void initDI() {
  _registerNewsRepository();
}

void _registerNewsRepository() {
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(NewsDataSourceImpl(NewsApiImpl())),
  );
}
