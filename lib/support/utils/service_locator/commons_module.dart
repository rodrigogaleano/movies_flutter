import '../../../api/routes/movies_routes.dart';
import '../../../api/setup/api_provider.dart';
import '../../../localization/localize.dart';
import 'app_module.dart';
import 'service_locator.dart';

class CommonsModule extends AppModule {
  @override
  void registerDependencies() {
    // API Routes
    ServiceLocator.registerFactory<MoviesRoutesProtocol>(() => MoviesRoutes());

    // Singletons
    ServiceLocator.registerSingleton<ApiProvider>(ApiProvider.instance);
    ServiceLocator.registerSingleton<LocalizeProtocol>(Localize.instance);
  }
}
