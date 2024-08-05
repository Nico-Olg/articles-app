import 'package:article_app/src/domain/entities/article.dart';

import '../models/article_api.dart';

class ArticleRepository {
  final ArticleApi articleApi;

  ArticleRepository(this.articleApi);

  Future<List<Article>> fetchArticles() async {
    return await articleApi.fetchArticles();
  }
}
