import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/architecture/data/repository/news_repository.dart';
import 'package:r_d_flutter_course/features/architecture/presentation/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._repository) : super(const NewsState.initial());

  final NewsRepository _repository;

  Future<void> getNews() async {
    try {
      final news = await _repository.getNews();

      emit(state.copyWith(status: NewsStatus.loaded, news: news));
    } catch (e) {
      emit(
        state.copyWith(status: NewsStatus.error, errorMessage: e.toString()),
      );

      rethrow;
    }
  }
}
