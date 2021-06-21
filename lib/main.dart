import 'package:desafio_flutter/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter/movie_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      debugShowCheckedModeBanner: false,
      home: MovieApp(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        'DetailScreen': (context) => MovieDetail(),
      },
    );
  }
}
