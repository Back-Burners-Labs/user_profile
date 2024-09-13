import '../../../core/app_export.dart';
import '../controller/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
    Get.lazyPut(() => LanguageController());
  }
}
