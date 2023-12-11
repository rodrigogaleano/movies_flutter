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

// {
//   "adult": false,
//   "backdrop_path": "/51UDa3IuGyiKGe2MgMcLGvJE2Fm.jpg",
//   "belongs_to_collection": null,
//   "budget": 40000000,
//   "genres": [
//     {
//       "id": 53,
//       "name": "Thriller"
//     },
//     {
//       "id": 80,
//       "name": "Crime"
//     },
//     {
//       "id": 18,
//       "name": "Drama"
//     }
//   ],
//   "homepage": "http://www.miramax.com/movie/the-talented-mr-ripley/",
//   "id": 1213,
//   "imdb_id": "tt0134119",
//   "original_language": "en",
//   "original_title": "The Talented Mr. Ripley",
//   "overview": "Tom Ripley is a calculating young man who believes it's better to be a fake somebody than a real nobody. Opportunity knocks in the form of a wealthy U.S. shipbuilder who hires Tom to travel to Italy to bring back his playboy son, Dickie. Ripley worms his way into the idyllic lives of Dickie and his girlfriend, plunging into a daring scheme of duplicity, lies and murder.",
//   "popularity": 31.654,
//   "poster_path": "/6ojHgqtIR41O2qLKa7LFUVj0cZa.jpg",
//   "production_companies": [
//     {
//       "id": 14,
//       "logo_path": "/m6AHu84oZQxvq7n1rsvMNJIAsMu.png",
//       "name": "Miramax",
//       "origin_country": "US"
//     },
//     {
//       "id": 4,
//       "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
//       "name": "Paramount",
//       "origin_country": "US"
//     },
//     {
//       "id": 932,
//       "logo_path": null,
//       "name": "Mirage Enterprises",
//       "origin_country": "US"
//     },
//     {
//       "id": 679,
//       "logo_path": null,
//       "name": "Timnick Films",
//       "origin_country": ""
//     }
//   ],
//   "production_countries": [
//     {
//       "iso_3166_1": "US",
//       "name": "United States of America"
//     }
//   ],
//   "release_date": "1999-12-25",
//   "revenue": 128798265,
//   "runtime": 139,
//   "spoken_languages": [
//     {
//       "english_name": "English",
//       "iso_639_1": "en",
//       "name": "English"
//     },
//     {
//       "english_name": "Italian",
//       "iso_639_1": "it",
//       "name": "Italiano"
//     }
//   ],
//   "status": "Released",
//   "tagline": "How far would you go to become someone else?",
//   "title": "The Talented Mr. Ripley",
//   "video": false,
//   "vote_average": 7.181,
//   "vote_count": 3309
// }