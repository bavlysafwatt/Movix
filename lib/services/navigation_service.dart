import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => widget));
  }

  pop(Widget widget) {
    return navigatorKey.currentState?.pop();
  }

  Future<void> showDialog(Widget widget) async {
    await showAdaptiveDialog(
        context: navigatorKey.currentContext!, builder: (context) => widget);
  }

  void showSnackbar() {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Hello, World from Movix App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }
}
