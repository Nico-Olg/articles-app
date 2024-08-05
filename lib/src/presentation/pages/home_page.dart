import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:article_app/src/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:article_app/src/core/di/dependency_injection.dart';
import 'package:article_app/providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ArticleBloc>()..add(LoadArticles()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Articles'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            Switch(
              value: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
              },
            ),
          ],
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ArticleLoaded) {
              final size = MediaQuery.of(context).size;
              return SizedBox(
                width: double.infinity,
                height: size.height * 0.5,
                child: Swiper(
                  itemCount: state.articles.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width * 0.6,
                  itemHeight: size.height * 0.4,
                  itemBuilder: (_, index) {
                    final article = state.articles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail', arguments: article);
                      },
                      child: Hero(
                        tag: 'swiper-${article.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Text(
                                      article.body,
                                      style: TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is ArticleError) {
              return Center(
                child: Text(
                  'Failed to load articles',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
