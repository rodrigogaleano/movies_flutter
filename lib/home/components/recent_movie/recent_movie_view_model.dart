import '../../../support/extensions/string_extensions.dart';
import '../../models/movie.dart';
import 'recent_movie_view.dart';

class RecentMovieViewModel extends RecentMovieViewModelProtocol {
  final Movie movie;

  RecentMovieViewModel({
    required this.movie,
    required this.isLastItem,
    required this.isFirstItem,
  });

  @override
  final bool isLastItem;

  @override
  final bool isFirstItem;

  @override
  String get title => movie.title;

  @override
  String get posterPath => movie.posterPath.toPosterPathUrl();
}
