import 'package:flutter/material.dart';

import '../../data/models/article_model.dart';




class ArticleDetailPage extends StatelessWidget {
  final ArticleModel article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(article.body.toString(),
      ),
    ));
  }
}