import '../../../../../core/app_export.dart';
import '../../preference/controllers/preference_controller.dart';

class PreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreferenceController());
    Get.lazyPut<PreferenceController>(
      () => PreferenceController(),
    );
  }
}
