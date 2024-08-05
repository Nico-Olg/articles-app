import 'package:article_app/src/domain/entities/fetch_article.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:article_app/src/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:article_app/src/domain/entities/article.dart';
import 'article_bloc_test.mocks.dart';

@GenerateMocks([FetchArticles])
void main() {
  late ArticleBloc articleBloc;
  late MockFetchArticles mockFetchArticles;

  setUp(() {
    mockFetchArticles = MockFetchArticles();
    articleBloc = ArticleBloc(mockFetchArticles);
  });

  blocTest<ArticleBloc, ArticleState>(
    'emits [ArticleLoading, ArticleLoaded] when LoadArticles is added.',
    build: () {
      when(mockFetchArticles()).thenAnswer((_) async => [Article(id: 1, title: 'Test', body: 'Test Body', userId: 1)]);
      return articleBloc;
    },
    act: (bloc) => bloc.add(LoadArticles()),
    expect: () => [
      ArticleLoading(),
      ArticleLoaded([Article(id: 1, title: 'Test', body: 'Test Body', userId: 1)])
    ],
  );

  blocTest<ArticleBloc, ArticleState>(
    'emits [ArticleLoading, ArticleError] when LoadArticles is added and an exception is thrown.',
    build: () {
      when(mockFetchArticles()).thenThrow(Exception('Failed to load articles'));
      return articleBloc;
    },
    act: (bloc) => bloc.add(LoadArticles()),
    expect: () => [
      ArticleLoading(),
      ArticleError('Exception: Failed to load articles')
    ],
  );
}
