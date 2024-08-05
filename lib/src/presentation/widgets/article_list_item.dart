import 'package:flutter/material.dart';

import '../../data/models/article_model.dart';
import '../pages/article_detail_page.dart';

class ArticleListItem extends StatelessWidget {
  final ArticleModel article;

  ArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.body.toString()),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
          ),
        );
      },
    );
  }
}