class Movie {
  int id;
  String title;
  String urlImage;
  String releaseDate;
  String overview;
  dynamic rating;

  // É metodo construtor para instanciar a classe.
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overview = json['overview'];
    title = json['title'];
    urlImage = json['poster_path'];
    releaseDate = json['release_date'];
    rating = json['vote_average'];
  }

  // É metodo para criar um OBJETO com o ID do filme.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
