part of 'news_cubit.dart';

enum NewsStatus { loading, loaded, error }

class NewsState extends Equatable {
  const NewsState({required this.articles, required this.status});

  factory NewsState.initial() =>
      const NewsState(articles: [], status: NewsStatus.loading);

  final List<ArticleEntity> articles;
  final NewsStatus status;

  NewsState copyWith({List<ArticleEntity>? articles, NewsStatus? status}) =>
      NewsState(
        articles: articles ?? this.articles,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [articles, status];
}
