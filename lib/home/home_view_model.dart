import '../support/components/movie_item/movie_item_view.dart';
import '../support/components/movie_item/movie_item_view_model.dart';
import 'home_view_controller.dart';
import 'models/movie.dart';
import 'use_cases/get_now_playing_movies_use_case.dart';
import 'use_cases/get_popular_movies_use_case.dart';

class HomeViewModel extends HomeProtocol {
  String _errorMessage = '';
  bool _isRecentMoviesLoading = false;
  bool _isPopularMoviesLoading = false;

  final List<Movie> _recentMovies = [];
  final List<Movie> _popularMovies = [];

  final GetPopularMoviesUseCaseProtocol getPopularMoviesUseCaseProtocol;
  final GetNowPlayingMoviesUseCaseProtocol getNowPlayingMoviesUseCaseProtocol;

  HomeViewModel({
    required this.getPopularMoviesUseCaseProtocol,
    required this.getNowPlayingMoviesUseCaseProtocol,
  });

  @override
  bool get isLoading => _isRecentMoviesLoading || _isPopularMoviesLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  List<MovieItemViewModelProtocol> get recentMoviesViewModels {
    return _recentMovies.map((movie) {
      final isFirstItem = _recentMovies.indexOf(movie) == 0;
      final isLastItem = _recentMovies.indexOf(movie) == _recentMovies.length - 1;

      return MovieItemViewModel(
        movie: movie,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get popularMoviesViewModels {
    return _popularMovies.map((movie) {
      final isFirstItem = _popularMovies.indexOf(movie) == 0;
      final isLastItem = _popularMovies.indexOf(movie) == _recentMovies.length - 1;

      return MovieItemViewModel(
        movie: movie,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  void loadContent() {
    _setLoadingAsTrue();
    _getPopularMovies();
    _getNowPlayingMovies();
  }

  void _getNowPlayingMovies() {
    getNowPlayingMoviesUseCaseProtocol.execute(
      success: (response) {
        _recentMovies.addAll(response);
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () {
        _isRecentMoviesLoading = false;
        notifyListeners();
      },
    );
  }

  void _getPopularMovies() {
    getPopularMoviesUseCaseProtocol.execute(
      success: (response) {
        _popularMovies.addAll(response);
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () {
        _isPopularMoviesLoading = false;
        notifyListeners();
      },
    );
  }

  void _setLoadingAsTrue() {
    _isRecentMoviesLoading = true;
    _isPopularMoviesLoading = true;
    notifyListeners();
  }
}
