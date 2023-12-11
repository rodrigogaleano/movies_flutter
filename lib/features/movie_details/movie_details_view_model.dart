import '../../support/extensions/string_extensions.dart';
import 'models/movie_details.dart';
import 'movie_details_view_controller.dart';
import 'use_cases/get_movie_details_use_case.dart';

class MovieDetailsViewModel extends MovieDetailsProtocol {
  MovieDetails? _movie;
  bool _isLoading = false;
  String _errorMessage = '';

  final int movieId;
  final GetMovieDetailsUseCaseProtocol getMovieDetailsUseCaseProtocol;

  MovieDetailsViewModel({
    required this.movieId,
    required this.getMovieDetailsUseCaseProtocol,
  });

  @override
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  String get title => _movie?.title ?? '';

  @override
  String get backdropPath => _movie?.backdropPath.toPosterPathUrl() ?? '';

  @override
  String get overview => _movie?.overview ?? '';

  @override
  String get genres => _movie?.genres.join(', ') ?? '';

  @override
  String get voteAverage => _movie?.voteAverage.toStringAsFixed(1) ?? '';

  @override
  double get voteAverageValue => (_movie?.voteAverage ?? 0) / 10;

  @override
  String get runtime => _movie?.runtime.toString() ?? '';

  @override
  String get releaseYear {
    final year = (_movie?.releaseDate.split('-'))?.first;
    return year ?? '';
  }

  @override
  bool get hasCollection => _movie?.collection != null;

  @override
  String get collectionBackdropPath => _movie?.collection?.backdropPath.toPosterPathUrl() ?? '';

  @override
  String get collectionName => _movie?.collection?.name ?? '';

  @override
  void loadContent() {
    _setLoading(true);
    getMovieDetailsUseCaseProtocol.execute(
      movieId: movieId,
      success: (response) {
        _movie = response;
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () {
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
