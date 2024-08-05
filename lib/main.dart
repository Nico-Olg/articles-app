import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:article_app/src/core/di/dependency_injection.dart';
import 'package:article_app/src/presentation/pages/home_page.dart';
import 'providers/theme_provider.dart'; 

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Article App',
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
