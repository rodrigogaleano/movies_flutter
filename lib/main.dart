import 'package:flutter/material.dart';

import 'router/mobile_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: MobileRouter.router,
    ),
  );
}
