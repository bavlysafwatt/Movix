import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movix/providers/movies_provider.dart';
import 'package:movix/providers/theme_provider.dart';
import 'package:movix/screens/splash_screen.dart';
import 'package:movix/services/init_getit.dart';
import 'package:movix/services/navigation_service.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const Movix());
  });
}

class Movix extends StatelessWidget {
  const Movix({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<MoviesProvider>(
          create: (context) => MoviesProvider(),
        ),
      ],
      child: Consumer(builder: (context, ThemeProvider themeProvider, child) {
        return MaterialApp(
          navigatorKey: getIt<NavigationService>().navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeMode,
          home: SplashScreen(),
        );
      }),
    );
  }
}
