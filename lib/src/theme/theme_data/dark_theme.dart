import '../../core/app_export.dart';
import '../../core/constants/app_fonts.dart';

ThemeData darkThemeData() {
  return ThemeData(
      primaryColor: const Color(0xFF252525),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0),
      scaffoldBackgroundColor: const Color(0xFF2C2C2C),
      brightness: Brightness.dark,
      dividerColor: AppColor.lightGrey,
      focusColor: AppColor.primary,
      hintColor: AppColor.grey,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColor.primary),
      ),
      fontFamily: AppFonts.contents,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColor.creamColor),
        bodyMedium: TextStyle(color: AppColor.creamColor),
        bodySmall: TextStyle(color: AppColor.creamColor),
        displayLarge: TextStyle(color: AppColor.creamColor),
        displayMedium: TextStyle(color: AppColor.creamColor),
        displaySmall: TextStyle(color: AppColor.creamColor),
        headlineLarge: TextStyle(color: AppColor.creamColor),
        headlineMedium: TextStyle(color: AppColor.creamColor),
        headlineSmall: TextStyle(color: AppColor.creamColor),
        labelLarge: TextStyle(color: AppColor.creamColor),
        labelMedium: TextStyle(color: AppColor.creamColor),
        labelSmall: TextStyle(color: AppColor.creamColor),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.primary,
      ),
    );
}
