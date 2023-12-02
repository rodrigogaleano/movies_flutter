import 'home_view_controller.dart';
import 'use_cases/get_now_playing_movies_use_case.dart';

class HomeViewModel extends HomeProtocol {
  final GetNowPlayingMoviesUseCaseProtocol getNowPlayingMoviesUseCaseProtocol;

  HomeViewModel({required this.getNowPlayingMoviesUseCaseProtocol});

  @override
  void loadContent() {
    getNowPlayingMoviesUseCaseProtocol.execute(
      success: (response) {},
      failure: (error) {},
    );
  }
}
