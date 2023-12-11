import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../movie_details_view_controller.dart';
import '../movie_details_view_model.dart';

class MovieDetailsModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactoryParam<MovieDetailsProtocol, int>((movieId) {
      return MovieDetailsViewModel(movieId: movieId);
    });
  }
}
