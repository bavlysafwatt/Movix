import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movix/providers/movies_provider.dart';
import 'package:movix/screens/movies_screen.dart';
import 'package:movix/services/init_getit.dart';
import 'package:movix/services/navigation_service.dart';
import 'package:movix/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _loadInitialData(BuildContext context) async {
    await Future.microtask(() async {
      if (!context.mounted) return;
      await Provider.of<MoviesProvider>(context, listen: false).getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: _loadInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.grey,
                size: 30,
              ),
            );
          } else if (snapshot.hasError) {
            if (moviesProvider.genresList.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<NavigationService>()
                    .navigateReplace(const MoviesScreen());
              });
            }
            return Provider.of<MoviesProvider>(context).isLoading
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.grey,
                      size: 30,
                    ),
                  )
                : MyErrorWidget(
                    errorText: snapshot.error.toString(),
                    retryFunction: () async {
                      await _loadInitialData(context);
                    },
                  );
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                getIt<NavigationService>()
                    .navigateReplace(const MoviesScreen());
              },
            );
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
