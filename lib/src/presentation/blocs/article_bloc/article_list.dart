import 'package:article_app/src/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Articles')),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ArticleLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.articles[index].title),
                  onTap: () {
                    // Navegar al detalle del artículo
                  },
                );
              },
            );
          } else if (state is ArticleError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No articles'));
        },
      ),
    );
  }
}
