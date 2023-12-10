import 'dart:ui';

import '../../api/routes/movies_routes.dart';
import '../../models/server_error.dart';
import '../models/movie.dart';

typedef Success = void Function(List<Movie> movies);
typedef Failure = void Function(ServerError error);

abstract class GetUpcomingMoviesUseCaseProtocol {
  void execute({Success? success, Failure? failure, VoidCallback? onComplete});
}

class GetUpcomingMoviesUseCase extends GetUpcomingMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetUpcomingMoviesUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, VoidCallback? onComplete}) {
    routes.getUpcomingMovies(
      success: (response) {
        try {
          final upcomingMovies = Movie.fromMaps(response['results']);
          success?.call(upcomingMovies);
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
