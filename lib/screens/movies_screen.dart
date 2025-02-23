import 'package:flutter/material.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/constants/app_theme_data.dart';
import 'package:movix/providers/theme_provider.dart';
import 'package:movix/screens/favorites_screen.dart';
import 'package:movix/services/init_getit.dart';
import 'package:movix/services/navigation_service.dart';
import 'package:movix/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoritesScreen());
            },
            icon: Icon(
              AppIcons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () => themeProvider.toggleTheme(),
            icon: Icon(
              themeProvider.themeMode == AppThemeData.lightTheme
                  ? AppIcons.darkMode
                  : AppIcons.lightMode,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => MoviesWidget(),
      ),
    );
  }
}
