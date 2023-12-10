import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'router/mobile_router.dart';
import 'support/style/app_themes.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  initializeDependencies();

  runApp(
    MaterialApp.router(
      theme: AppThemes.theme,
      routerConfig: MobileRouter.router,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
    ),
  );
}
