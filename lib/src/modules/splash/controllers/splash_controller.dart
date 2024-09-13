import 'dart:ui';
import 'package:get/get.dart';
import '../../auth/controllers/login_controller.dart';
import '../../panels/user/root/bindings/root_binding.dart';
import '../../panels/user/root/views/root_view.dart';
import '../../../theme/controller/theme_controller.dart';
import '../../onboarding/bindings/onBoarding_binding.dart';
import '../../onboarding/pages/onBoarding_view.dart';

class SplashController extends GetxController {
  final ThemeController _themeController = Get.find();

  Future getLocaleData() async {
    Locale locale = await _themeController.getLocale();
    Get.updateLocale(locale);
  }

  @override
  void onReady() {
    super.onReady();
    getLocaleData().then((value) async {
      await Future.delayed(const Duration(seconds: 2));
      if (await LoginController().isLogged) {
        Get.off(() => UserRootView(),
            binding: RootBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.circularReveal);
      } else {
        Get.off(() => const OnBoardingView(),
            binding: OnBoardingBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.circularReveal);
      }
    });
  }
}
