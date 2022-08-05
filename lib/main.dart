import 'package:flutter/material.dart';

import 'movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade200,
        ),
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesPage(),
    );
  }
}
