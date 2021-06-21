import 'dart:async';

import 'package:desafio_flutter/movie.dart';
import 'package:desafio_flutter/movie_model.dart';

class MovieViewModel {
  var page = 1;
  final _viewModel = MovieModel();
  List<Movie> arrayMovie = [];
  Future<List<Movie>> get movie => _viewModel.movie;
  StreamController movieStream = StreamController();

  Future<void> loadMovie() async {
    return await _viewModel.fetchMovie(page).then((value) {
      arrayMovie.addAll(value);
      movieStream.add(arrayMovie);
      page++;
    });
  }
}
