import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/top_news/data/repository/models/article_entity.dart';
import 'package:r_d_flutter_course/features/top_news/data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubitCourse extends Cubit<NewsState> {
  NewsCubitCourse({required this.repository}) : super(NewsState.initial());

  final ArticleRepository repository;

  Future<void> getTopNews() async {
    try {
      emit(state.copyWith(status: NewsStatus.loading));

      final articles = await repository.getTopNews();

      emit(state.copyWith(status: NewsStatus.loaded, articles: articles));
    } catch (e) {
      emit(state.copyWith(status: NewsStatus.error));

      rethrow;
    }
  }
}
