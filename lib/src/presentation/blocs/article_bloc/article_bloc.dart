import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:article_app/src/domain/entities/article.dart';
import 'package:article_app/src/domain/entities/fetch_article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final FetchArticles fetchArticles;

  ArticleBloc(this.fetchArticles) : super(ArticleLoading()) {
    on<LoadArticles>((event, emit) async {
      emit(ArticleLoading());
      try {
        final articles = await fetchArticles();
        emit(ArticleLoaded(articles));
      } catch (e) {
        emit(ArticleError(e.toString()));
      }
    });
  }
}
