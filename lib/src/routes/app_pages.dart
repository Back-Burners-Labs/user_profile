import 'package:get/get.dart';

import '../modules/onboarding/pages/onBoarding_view.dart';
import '../modules/panels/user/home/views/home_view.dart';
import '../modules/panels/user/root/bindings/root_binding.dart';
import '../modules/onboarding/bindings/onBoarding_binding.dart';
import '../modules/panels/user/home/bindings/home_binding.dart';
import '../modules/panels/user/root/views/root_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/pages/splash_screen.dart';
import 'app_routes.dart';

class AppRoutePages {
  static const initial = AppRouteNames.initialRoute;
  static final pages = [
    GetPage(
      name: AppRouteNames.initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: AppRouteNames.onBoardingRoute,
      page: () => const OnBoardingView(),
      bindings: [
        OnBoardingBinding(),
      ],
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRouteNames.rootRoute,
      page: () => UserRootView(),
      bindings: [
        RootBinding(),
      ],
    ),
    GetPage(
      name: AppRouteNames.homeRoute,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
