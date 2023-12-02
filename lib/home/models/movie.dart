class Movie {
  int id;
  String title;

  Movie.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'];

  static List<Movie> fromMaps(List<dynamic> maps) {
    return maps.map((movie) => Movie.fromMap(movie)).toList();
  }
}
