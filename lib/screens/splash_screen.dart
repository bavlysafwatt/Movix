import 'package:flutter/material.dart';
import 'package:movix/widgets/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyErrorWidget(
        errorText: "There was an error, try again later.",
        retryFunction: () {},
      ),
    );
  }
}
