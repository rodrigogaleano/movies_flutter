import 'package:flutter/material.dart';
import 'package:movies/router/mobile_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: MobileRouter.router,
    ),
  );
}
