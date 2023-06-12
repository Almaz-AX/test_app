import 'package:flutter/material.dart';
import 'package:test_app/ui/navigation/main_navigation.dart';

import 'package:test_app/ui/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final mainNavigation = MainNavigation();
    return MaterialApp(
      theme: ThemeClass.themeLight,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.main,
    );
  }
}


