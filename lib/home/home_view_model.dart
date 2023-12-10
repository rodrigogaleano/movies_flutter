import 'components/recent_movie/recent_movie_view.dart';
import 'components/recent_movie/recent_movie_view_model.dart';
import 'home_view_controller.dart';
import 'models/movie.dart';
import 'use_cases/get_now_playing_movies_use_case.dart';

class HomeViewModel extends HomeProtocol {
  bool _isLoading = false;
  final List<Movie> _recentMovies = [];

  final GetNowPlayingMoviesUseCaseProtocol getNowPlayingMoviesUseCaseProtocol;

  HomeViewModel({required this.getNowPlayingMoviesUseCaseProtocol});

  @override
  bool get isLoading => _isLoading;

  @override
  List<RecentMovieViewModelProtocol> get recentMoviesViewModels {
    return _recentMovies.map((movie) {
      final isFirstItem = _recentMovies.indexOf(movie) == 0;
      final isLastItem = _recentMovies.indexOf(movie) == _recentMovies.length - 1;

      return RecentMovieViewModel(
        movie: movie,
        isLastItem: isLastItem,
        isFirstItem: isFirstItem,
      );
    }).toList();
  }

  @override
  void loadContent() {
    _setLoading(true);
    getNowPlayingMoviesUseCaseProtocol.execute(
      success: (response) {
        _recentMovies.addAll(response);
        _setLoading(false);
      },
      failure: (error) {
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
