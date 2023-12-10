import '../../../home/models/movie.dart';
import '../../extensions/string_extensions.dart';
import 'movie_item_view.dart';

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movie movie;

  MovieItemViewModel({
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
