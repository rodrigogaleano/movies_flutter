import 'collection.dart';

class MovieDetails {
  int id;
  int runtime;
  String title;
  String overview;
  double voteAverage;
  String releaseDate;
  String backdropPath;
  List<String> genres;
  Collection? collection;

  MovieDetails.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        runtime = map['runtime'],
        overview = map['overview'],
        releaseDate = map['release_date'],
        voteAverage = map['vote_average'],
        backdropPath = map['backdrop_path'],
        genres = List<String>.from(map['genres'].map((genre) => genre['name'])),
        collection = Collection.fromMap(map['belongs_to_collection']);
}
