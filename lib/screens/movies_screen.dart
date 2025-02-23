import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movix/constants/app_icons.dart';
import 'package:movix/constants/app_theme_data.dart';
import 'package:movix/providers/movies_provider.dart';
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
      body: Consumer(builder: (context, MoviesProvider moviesProvider, child) {
        if (moviesProvider.isLoading && moviesProvider.moviesList.isEmpty) {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.grey,
              size: 30,
            ),
          );
        } else if (moviesProvider.fetchMoviesError.isNotEmpty) {
          return const Text("Error fetching movies: $e");
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent &&
                !moviesProvider.isLoading) {
              moviesProvider.getMovies();
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemCount: moviesProvider.moviesList.length +
                (moviesProvider.isLoading ? 1 : 0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < moviesProvider.moviesList.length) {
                return MoviesWidget();
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
