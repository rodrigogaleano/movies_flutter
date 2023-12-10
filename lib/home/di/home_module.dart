import '../../api/routes/movies_routes.dart';
import '../../support/utils/service_locator/app_module.dart';
import '../../support/utils/service_locator/service_locator.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_now_playing_movies_use_case.dart';
import '../use_cases/get_popular_movies_use_case.dart';
import '../use_cases/get_top_rated_movies_use_case.dart';

class HomeModule extends AppModule {
  @override
  void registerDependencies() {
    // Use Cases

    ServiceLocator.registerFactory<GetPopularMoviesUseCaseProtocol>(() {
      return GetPopularMoviesUseCase(routes: ServiceLocator.get<MoviesRoutesProtocol>());
    });

    ServiceLocator.registerFactory<GetTopRatedMoviesUseCaseProtocol>(() {
      return GetTopRatedMoviesUseCase(routes: ServiceLocator.get<MoviesRoutesProtocol>());
    });

    ServiceLocator.registerFactory<GetNowPlayingMoviesUseCaseProtocol>(() {
      return GetNowPlayingMoviesUseCase(routes: ServiceLocator.get<MoviesRoutesProtocol>());
    });

    // ViewModel

    ServiceLocator.registerFactory<HomeProtocol>(() {
      return HomeViewModel(
        getPopularMoviesUseCaseProtocol: ServiceLocator.get<GetPopularMoviesUseCaseProtocol>(),
        getTopRatedMoviesUseCaseProtocol: ServiceLocator.get<GetTopRatedMoviesUseCaseProtocol>(),
        getNowPlayingMoviesUseCaseProtocol: ServiceLocator.get<GetNowPlayingMoviesUseCaseProtocol>(),
      );
    });
  }
}
