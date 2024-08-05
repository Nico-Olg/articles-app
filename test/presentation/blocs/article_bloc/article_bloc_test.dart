import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:article_app/src/domain/entities/article.dart';
import 'package:article_app/src/domain/entities/fetch_article.dart';



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

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticleEvent {}

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object?> get props => [];
}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  const ArticleLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError(this.message);

  @override
  List<Object?> get props => [message];
}
