import 'package:r_d_flutter_course/features/architecture/data/repository/entities/new_entity.dart';

class NewsState {
  const NewsState({
    this.status = NewsStatus.initial,
    this.news = const [],
    this.errorMessage,
  });

  const NewsState.initial()
    : status = NewsStatus.loading,
      news = const [],
      errorMessage = null;

  final NewsStatus status;
  final List<NewEntity> news;
  final String? errorMessage;

  NewsState copyWith({
    NewsStatus? status,
    List<NewEntity>? news,
    String? errorMessage,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum NewsStatus { initial, loading, loaded, error }
