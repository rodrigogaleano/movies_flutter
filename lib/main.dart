import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'router/mobile_router.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  initializeDependencies();

  runApp(
    MaterialApp.router(
      routerConfig: MobileRouter.router,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
    ),
  );
}
