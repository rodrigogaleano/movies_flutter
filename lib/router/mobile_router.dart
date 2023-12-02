import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/home_view_controller.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static const String homeRoute = '/home';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: homeRoute,
    routes: <RouteBase>[
      GoRoute(
        path: homeRoute,
        name: homeRoute,
        builder: (_, __) => const HomeViewController(),
      ),
    ],
  );
}
