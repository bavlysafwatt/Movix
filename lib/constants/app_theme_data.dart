import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    textTheme: ThemeData.light().textTheme.apply(fontFamily: "SanFrancisco"),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    colorScheme: ColorScheme.light(
      surface: Color.fromARGB(26, 13, 184, 247),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: "SanFrancisco"),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(
        // surface: Color.fromARGB(26, 13, 184, 247),
        ),
  );
}
