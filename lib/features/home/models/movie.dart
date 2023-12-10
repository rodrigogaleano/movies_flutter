class Movie {
  int id;
  String title;
  String posterPath;

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        posterPath = map['poster_path'];

  static List<Movie> fromMaps(List<dynamic> maps) {
    return maps.map((movie) => Movie.fromMap(movie)).toList();
  }
}
