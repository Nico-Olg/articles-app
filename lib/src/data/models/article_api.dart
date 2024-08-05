import 'package:article_app/src/data/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleApi {
  final http.Client client;
  final String apiUrl;

  ArticleApi(this.client, this.apiUrl);

  Future<List<ArticleModel>> fetchArticles() async {
    final response = await client.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((article) => ArticleModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
