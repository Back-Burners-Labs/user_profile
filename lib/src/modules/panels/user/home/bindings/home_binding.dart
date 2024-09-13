import 'package:get/get.dart';
import '../../../../../core/api/api.dart';
import '../../../../../modules/auth/controllers/login_controller.dart';
import '../../root/controllers/root_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(RootController());
    Get.put(LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(() => UserApi());
  }
}
