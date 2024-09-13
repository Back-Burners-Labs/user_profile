import 'package:get/get.dart';
import '../../../../../modules/auth/controllers/login_controller.dart';
import '../../../../../theme/controller/theme_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../preference/controllers/preference_controller.dart';
import '../../profile/controllers/edit_profile_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<RootController>(() => RootController());
    Get.put(LoginController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => PreferenceController());
  }
}
