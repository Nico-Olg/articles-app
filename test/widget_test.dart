import 'package:article_app/src/domain/entities/fetch_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:article_app/main.dart';
import 'package:article_app/src/core/di/dependency_injection.dart'  as di;
import 'package:article_app/src/data/repositories/article_repository.dart';
import 'package:article_app/src/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:article_app/src/data/models/article_model.dart';

// Mock de ArticleRepository
class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  setUpAll(() {
    di.sl.reset();
    di.init();

    final mockArticleRepository = MockArticleRepository();
    when(mockArticleRepository.fetchArticles()).thenAnswer((_) async => [
      ArticleModel(id: 1, title: 'Test Article', body: 'This is a test article', userId: 2)
    ]);

    di.sl.unregister<ArticleRepository>();
    di.sl.registerSingleton<ArticleRepository>(mockArticleRepository);
    di.sl.unregister<ArticleBloc>();
    di.sl.registerFactory(() => ArticleBloc(di.sl<ArticleRepository>() as FetchArticles));
  });

  testWidgets('Articles list displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
  });
}
