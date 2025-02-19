import 'package:flutter/material.dart';
import 'package:movix/constants/app_theme_data.dart';
import 'package:movix/screens/movies_screen.dart';
import 'package:movix/services/init_getit.dart';
import 'package:movix/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(const Movix());
}

class Movix extends StatelessWidget {
  const Movix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      home: MoviesScreen(),
    );
  }
}
