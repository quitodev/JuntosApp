part of 'theme.dart';

class AppColors {
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 63, 0, 83),
    primaryContainer: Color.fromARGB(255, 43, 0, 60),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 128, 100, 200),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Color.fromARGB(255, 240, 240, 240),
    onBackground: Color.fromARGB(255, 80, 80, 80),
    surface: Color(0xFFFFFFFF),
    onSurface: Color.fromARGB(255, 150, 150, 150),
    shadow: Color.fromARGB(20, 0, 0, 0),
  );

  static const titleAppBar = Color.fromARGB(255, 255, 232, 105);
  static const itemDrawerDivider = Color.fromARGB(255, 220, 220, 220);
  static const boardButtons = Color.fromARGB(255, 254, 105, 76);
}
