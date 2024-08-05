import 'package:article_app/src/data/models/article_api.dart';
import 'package:article_app/src/domain/entities/fetch_article.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../data/repositories/article_repository.dart';
import '../../presentation/blocs/article_bloc/article_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => ArticleApi(sl<http.Client>(), 'https://jsonplaceholder.typicode.com/posts'));

  // Repository
  sl.registerLazySingleton(() => ArticleRepository(sl<ArticleApi>()));

  // Use cases
  sl.registerLazySingleton(() => FetchArticles(sl<ArticleRepository>()));

  // Bloc
  sl.registerFactory(() => ArticleBloc(sl<FetchArticles>()));
}
