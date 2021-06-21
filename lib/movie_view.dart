import 'package:desafio_flutter/movie_view_model.dart';
import 'package:desafio_flutter/movie_detail.dart';
import 'package:desafio_flutter/widgets/home/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter/movie.dart';

class MovieParams {
  Movie item;

  MovieParams(this.item);
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final viewModel = MovieViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.7))],
          ),
          child: Text(
            'Lançamentos',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: backgroundgradient(),
              child: StreamBuilder(
                stream: viewModel.movieStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ocorreu um erro, tente novamente mais tarde!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(30),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Movie filme = snapshot.data[index];
                        if (index == snapshot.data.length - 5) {
                          viewModel.loadMovie();
                        }
                        return GestureDetector(
                          child: MovieCard(filme: filme),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetail(
                                  filme: filme,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
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
