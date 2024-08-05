import '../entities/article.dart';
import '../../data/repositories/article_repository.dart';

class FetchArticles {
  final ArticleRepository repository;

  FetchArticles(this.repository);

  Future<List<Article>> call() async {
    return await repository.fetchArticles();
  }
}
