import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_view_controller.dart';
import '../features/movie_details/movie_details_view_controller.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static const String homeRoute = '/home';
  static const String movieDetails = 'movieDetails';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: homeRoute,
    routes: <RouteBase>[
      GoRoute(
        path: homeRoute,
        name: homeRoute,
        builder: (_, __) => const HomeViewController(),
        routes: [
          GoRoute(
            path: movieDetails,
            name: movieDetails,
            builder: (_, state) {
              final movieId = state.extra as int;
              return MovieDetailsViewController(movieId: movieId);
            },
          ),
        ],
      ),
    ],
  );
}
