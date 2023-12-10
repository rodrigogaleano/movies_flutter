import 'dart:ui';

import '../../api/routes/movies_routes.dart';
import '../../models/server_error.dart';
import '../models/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetPopularMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure, VoidCallback? onComplete});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, VoidCallback? onComplete}) {
    routes.getPopularMovies(
      success: (response) {
        try {
          final popularMovies = Movie.fromMaps(response['results']);
          success?.call(popularMovies);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
      onComplete: onComplete,
    );
  }
}
