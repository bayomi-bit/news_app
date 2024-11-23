part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
   final List<Article> articles;
  NewsSuccess(this.articles);

}

final class NewsError extends NewsState {
  final String message;
  NewsError(this.message);

}