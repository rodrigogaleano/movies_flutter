import '../../../support/extensions/string_extensions.dart';
import '../../models/movie.dart';
import 'recent_movie_view.dart';

class RecentMovieViewModel extends RecentMovieViewModelProtocol {
  final Movie movie;

  RecentMovieViewModel({required this.movie});

  @override
  String get title => movie.title;

  @override
  String get posterPath => movie.posterPath.toPosterPathUrl();
}
