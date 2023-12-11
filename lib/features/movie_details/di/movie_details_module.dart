import '../../../api/routes/movies_routes.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../movie_details_view_controller.dart';
import '../movie_details_view_model.dart';
import '../use_cases/get_movie_details_use_case.dart';

class MovieDetailsModule extends AppModule {
  @override
  void registerDependencies() {
    /// Use Cases
    ServiceLocator.registerFactory<GetMovieDetailsUseCaseProtocol>(() {
      return GetMovieDetailsUseCase(routes: ServiceLocator.get<MoviesRoutesProtocol>());
    });

    /// ViewModel
    ServiceLocator.registerFactoryParam<MovieDetailsProtocol, int>((movieId) {
      return MovieDetailsViewModel(
        movieId: movieId,
        getMovieDetailsUseCaseProtocol: ServiceLocator.get<GetMovieDetailsUseCaseProtocol>(),
      );
    });
  }
}
