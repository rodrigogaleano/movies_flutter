import '../../support/components/movie_item/movie_item_view.dart';
import '../../support/components/movie_item/movie_item_view_model.dart';
import 'home_view_controller.dart';
import 'models/movie.dart';
import 'use_cases/get_now_playing_movies_use_case.dart';
import 'use_cases/get_popular_movies_use_case.dart';
import 'use_cases/get_top_rated_movies_use_case.dart';
import 'use_cases/get_upcoming_movies_use_case.dart';

class HomeViewModel extends HomeProtocol implements MovieItemDelegate {
  String _errorMessage = '';
  bool _isRecentMoviesLoading = false;
  bool _isPopularMoviesLoading = false;
  bool _isTopRatedMoviesLoading = false;
  bool _isUpcomingMoviesLoading = false;

  final List<Movie> _recentMovies = [];
  final List<Movie> _popularMovies = [];
  final List<Movie> _topRatedMovies = [];
  final List<Movie> _upcomingMovies = [];

  final GetPopularMoviesUseCaseProtocol getPopularMoviesUseCaseProtocol;
  final GetTopRatedMoviesUseCaseProtocol getTopRatedMoviesUseCaseProtocol;
  final GetUpcomingMoviesUseCaseProtocol getUpcomingMoviesUseCaseProtocol;
  final GetNowPlayingMoviesUseCaseProtocol getNowPlayingMoviesUseCaseProtocol;

  HomeViewModel({
    required this.getPopularMoviesUseCaseProtocol,
    required this.getTopRatedMoviesUseCaseProtocol,
    required this.getUpcomingMoviesUseCaseProtocol,
    required this.getNowPlayingMoviesUseCaseProtocol,
  });

  @override
  bool get isLoading {
    return _isRecentMoviesLoading || _isPopularMoviesLoading || _isTopRatedMoviesLoading || _isUpcomingMoviesLoading;
  }

  @override
  String get errorMessage => _errorMessage;

  @override
  List<MovieItemViewModelProtocol> get recentMoviesViewModels {
    return _recentMovies.map((movie) {
      final isFirstItem = _recentMovies.indexOf(movie) == 0;
      final isLastItem = _recentMovies.indexOf(movie) == _recentMovies.length - 1;

      return MovieItemViewModel(
        movie: movie,
        delegate: this,
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
        delegate: this,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get topRatedMoviesViewModels {
    return _topRatedMovies.map((movie) {
      final isFirstItem = _topRatedMovies.indexOf(movie) == 0;
      final isLastItem = _topRatedMovies.indexOf(movie) == _topRatedMovies.length - 1;

      return MovieItemViewModel(
        movie: movie,
        delegate: this,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  List<MovieItemViewModelProtocol> get upcomingMoviesViewModels {
    return _upcomingMovies.map((movie) {
      final isFirstItem = _upcomingMovies.indexOf(movie) == 0;
      final isLastItem = _upcomingMovies.indexOf(movie) == _topRatedMovies.length - 1;

      return MovieItemViewModel(
        movie: movie,
        delegate: this,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  void loadContent() {
    _setLoadingAsTrue();
    _getPopularMovies();
    _getTopRatedMovies();
    _getUpcomingMovies();
    _getNowPlayingMovies();
  }

  @override
  void didTapMovie(int movieId) {
    onTapMovie?.call(movieId);
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

  void _getTopRatedMovies() {
    getTopRatedMoviesUseCaseProtocol.execute(
      success: (response) {
        _topRatedMovies.addAll(response);
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () {
        _isTopRatedMoviesLoading = false;
        notifyListeners();
      },
    );
  }

  void _getUpcomingMovies() {
    getUpcomingMoviesUseCaseProtocol.execute(
      success: (response) {
        _upcomingMovies.addAll(response);
      },
      failure: (error) {
        _errorMessage = error.description;
      },
      onComplete: () {
        _isUpcomingMoviesLoading = false;
        notifyListeners();
      },
    );
  }

  void _setLoadingAsTrue() {
    _isRecentMoviesLoading = true;
    _isPopularMoviesLoading = true;
    _isTopRatedMoviesLoading = true;
    _isUpcomingMoviesLoading = true;
    notifyListeners();
  }
}
