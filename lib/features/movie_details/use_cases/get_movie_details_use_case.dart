import 'dart:ui';

import '../../../api/routes/movies_routes.dart';
import '../../../models/server_error.dart';
import '../models/movie_details.dart';

typedef Success = void Function(MovieDetails movieDetails);
typedef Failure = void Function(ServerError error);

abstract class GetMovieDetailsUseCaseProtocol {
  void execute({
    required int movieId,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class GetMovieDetailsUseCase extends GetMovieDetailsUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetMovieDetailsUseCase({required this.routes});

  @override
  void execute({
    required int movieId,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    routes.getMovieDetails(
      movieId: movieId,
      success: (response) {
        try {
          final movieDetails = MovieDetails.fromMap(response);
          success?.call(movieDetails);
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
