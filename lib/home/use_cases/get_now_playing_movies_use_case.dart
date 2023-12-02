import '../../api/routes/movies_routes.dart';
import '../../models/server_error.dart';
import '../models/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetNowPlayingMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetNowPlayingMoviesUseCase extends GetNowPlayingMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetNowPlayingMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getNowPlayingMovies(
      success: (response) {
        try {
          final nowPlayingMovies = Movie.fromMaps(response['results']);
          success?.call(nowPlayingMovies);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
    );
  }
}
