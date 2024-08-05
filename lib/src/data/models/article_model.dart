import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({required int userId, required int id, required String title, required String body})
      : super(userId: userId, id: id, title: title, body: body);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
