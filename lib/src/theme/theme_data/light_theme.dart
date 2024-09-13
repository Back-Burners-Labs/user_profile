import '../../core/app_export.dart';
import '../../core/constants/app_fonts.dart';

ThemeData lightThemeData() {
  return ThemeData(
    primaryColor: AppColor.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0, foregroundColor: Colors.white),
    brightness: Brightness.light,
    dividerColor: AppColor.grey.withOpacity(0.5),
    focusColor: AppColor.primary,
    hintColor: AppColor.grey,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColor.primary),
    ),
    fontFamily: AppFonts.contents,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColor.textBlueGrey),
      bodyMedium: TextStyle(color: AppColor.textBlueGrey),
      bodySmall: TextStyle(color: AppColor.textBlueGrey),
      displayLarge: TextStyle(color: AppColor.textBlueGrey),
      displayMedium: TextStyle(color: AppColor.textBlueGrey),
      displaySmall: TextStyle(color: AppColor.textBlueGrey),
      headlineLarge: TextStyle(color: AppColor.textBlueGrey),
      headlineMedium: TextStyle(color: AppColor.textBlueGrey),
      headlineSmall: TextStyle(color: AppColor.textBlueGrey),
      labelLarge: TextStyle(color: AppColor.textBlueGrey),
      labelMedium: TextStyle(color: AppColor.textBlueGrey),
      labelSmall: TextStyle(color: AppColor.textBlueGrey),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.primary,
    ),
  );
}
