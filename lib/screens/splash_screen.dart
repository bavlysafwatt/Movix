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

  Future<void> loadInitialData(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Provider.of<MoviesProvider>(context, listen: false).getMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.grey,
              size: 30,
            );
          } else if (snapshot.hasError) {
            return MyErrorWidget(
              errorText: snapshot.error.toString(),
              retryFunction: () {},
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => getIt
                  .get<NavigationService>()
                  .navigateReplace(MoviesScreen()),
            );
            return SizedBox();
          }
        },
      ),
    );
  }
}
