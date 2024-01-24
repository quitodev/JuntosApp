part of 'theme.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Quicksand',
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightScheme,
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    drawerTheme: DrawerThemeData(
      surfaceTintColor: AppColors.lightScheme.surface,
    ),
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
    ),
    dialogBackgroundColor: Colors.white,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(
        Colors.transparent,
      ),
      thumbVisibility: MaterialStateProperty.all(
        false,
      ),
      radius: const Radius.circular(6),
    ),
  );
}
