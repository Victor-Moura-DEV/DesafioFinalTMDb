import 'package:desafio_flutter/db.dart';
import 'package:desafio_flutter/movie.dart';
import 'package:desafio_flutter/widgets/details/movie_thumb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key key, this.filme}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();

  final Movie filme;
}

class _MovieDetailState extends State<MovieDetail> {
  bool favorito = false;
  List<int> favoritos = [];

  Future loadFavorites() async {
    List<int> filmes = await DBConfig().getAllMovies();
    if (filmes.contains(widget.filme.id)) {
      setState(() {
        this.favorito = true;
      });
    }
    return this.favoritos = filmes;
  }

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundgradient(),
        child: ListView(
          padding: EdgeInsets.only(bottom: 18),
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MovieThumb(widget: widget),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.filme.releaseDate,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${widget.filme.rating}\n',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Score',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (favoritos.contains(widget.filme.id)) {
                                      await DBConfig().deleteMovie(
                                        widget.filme.id,
                                      );
                                      await DBConfig()
                                          .getAllMovies()
                                          .then((value) {
                                        setState(() {
                                          this.favoritos = value;
                                          print(value);
                                        });
                                      });
                                    } else {
                                      await DBConfig().insertFavorite(
                                        filmeID: widget.filme,
                                      );
                                      await DBConfig()
                                          .getAllMovies()
                                          .then((value) {
                                        setState(() {
                                          this.favoritos = value;
                                          print(value);
                                        });
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    favoritos.contains(widget.filme.id) == true
                                        ? Icons.star
                                        : Icons.star_border,
                                    color:
                                        favoritos.contains(widget.filme.id) ==
                                                true
                                            ? Colors.yellow
                                            : Colors.white,
                                    size: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              widget.filme.overview.isEmpty
                                  ? 'Não informado'
                                  : widget.filme.overview,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration backgroundgradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.pink,
          Colors.black,
        ],
      ),
    );
  }
}
