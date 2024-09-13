// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/api/api.dart';
import '../controllers/login_controller.dart';
import '../controllers/registration_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.lazyPut(() => LoginController());
    Get.put(RegistrationController());
    Get.lazyPut(() => RegistrationController());
    // Get.lazyPut(() => FirebaseAuth.instance);
    Get.put(AuthApi());
  }
}
