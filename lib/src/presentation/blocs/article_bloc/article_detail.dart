import 'package:article_app/src/domain/entities/article.dart';
import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.title),
      ),
    );
  }
}
