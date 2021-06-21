import 'package:desafio_flutter/movie_detail.dart';
import 'package:flutter/material.dart';

class MovieThumb extends StatelessWidget {
  const MovieThumb({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MovieDetail widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500${widget.filme.urlImage}',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(80)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.6),
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    widget.filme.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
