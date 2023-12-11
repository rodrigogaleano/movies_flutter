import '../../../features/home/models/movie.dart';
import '../../extensions/string_extensions.dart';
import 'movie_item_view.dart';

abstract class MovieItemDelegate {
  void didTapMovie(int movieId);
}

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movie movie;
  final MovieItemDelegate delegate;

  MovieItemViewModel({
    required this.movie,
    required this.delegate,
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

  @override
  void didTapMovie() {
    delegate.didTapMovie(movie.id);
  }
}
