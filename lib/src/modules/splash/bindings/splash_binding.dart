import 'package:get/get.dart';
import '../../../modules/language/controller/language_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => SplashController());
    Get.put(LanguageController(), permanent: true);
    Get.lazyPut(() => LanguageController());
  }
}
