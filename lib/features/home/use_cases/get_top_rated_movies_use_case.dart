import 'dart:ui';

import '../../../api/routes/movies_routes.dart';
import '../../../models/server_error.dart';
import '../models/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetTopRatedMoviesUseCaseProtocol {
  void execute({
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class GetTopRatedMoviesUseCase extends GetTopRatedMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetTopRatedMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, VoidCallback? onComplete}) {
    routes.getTopRatedMovies(
      success: (response) {
        try {
          final topRatedMovies = Movie.fromMaps(response['results']);
          success?.call(topRatedMovies);
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
