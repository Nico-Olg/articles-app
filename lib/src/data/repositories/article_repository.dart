import 'package:article_app/src/data/models/article_api.dart';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ArticleRepository {
  final ArticleApi articleApi;

  ArticleRepository(this.articleApi);

  Future<List<ArticleModel>> fetchArticles() async {
    return await articleApi.fetchArticles();
  }
}
