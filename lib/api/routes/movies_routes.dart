import '../../support/utils/service_locator/service_locator.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getNowPlayingMovies({Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();

  @override
  void getNowPlayingMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      path: '/movie/now_playing',
      method: 'GET',
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
    );
  }
}
