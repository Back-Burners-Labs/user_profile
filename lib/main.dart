import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './src/core/app_export.dart';
import './src/modules/splash/bindings/splash_binding.dart';
import './src/localization/app_localization.dart';
import './src/routes/app_pages.dart';
import './src/theme/controller/theme_controller.dart';
// import './src/theme/controller/theme_controller.dart';
import './src/theme/theme_data/theme.dart';
import 'src/core/api/api_config.dart';
import 'src/routes/app_routes.dart';
// import './firebase_core.dart';
// import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpOverrides.global = CustomHttpOverrides();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
    Get.put(ThemeController(), permanent: true);
    return GetMaterialApp(
      title: "BBL - User Profile",
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRouteNames.initialRoute,
      getPages: AppRoutePages.pages,
      supportedLocales: const [Locale('ar', 'AE')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialBinding: SplashBinding(),
      themeMode: themeController.themeStateFromHiveSettingBox,
      theme: ThemeX.lightTheme,
      darkTheme: ThemeX.darkTheme,
    );
  }
}
