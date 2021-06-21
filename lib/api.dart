import 'dart:convert';

import 'package:desafio_flutter/movie.dart';

import 'package:http/http.dart' as http;

class API {
  Future<List<Movie>> fetchMovie(int page) async {
    final response = await http.get(Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {
        'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
        'language': "pt-br",
        'sort_by': "vote_count.desc",
        'page': page.toString(),
      },
    ));
    if (response.statusCode == 200) {
      List<Movie> arrayMovies = [];

      final json = jsonDecode(response.body);
      List<dynamic> data = json['results'];
      print(data);
      data.forEach((element) {
        arrayMovies.add(Movie.fromJson(element));
      });
      return arrayMovies;
    } else {
      return Future.error('Connection lost');
    }
  }

  // Future<List<dynamic>> fetchMovieId(int id)
}
