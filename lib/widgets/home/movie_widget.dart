import 'package:desafio_flutter/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  MovieCard({Key key, this.filme}) : super(key: key);

  final Movie filme;

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: 400,
      height: 500,
      color: Colors.grey[700],
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${widget.filme.urlImage}',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          buildMovieRealeaseDate(widget.filme),
          Positioned.fill(
            child: buildMovieTitle(widget.filme),
          ),
        ],
      ),
    );
  }

  Positioned buildMovieRealeaseDate(Movie filme) {
    return Positioned(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(
          filme.releaseDate,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.70),
            )
          ],
        ),
      ),
      top: 8,
      right: 8,
    );
  }

  Align buildMovieTitle(Movie filme) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            filme.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.80),
            )
          ],
        ),
      ),
    );
  }
}
