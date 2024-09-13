import 'package:get/get.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import '../../preference/controllers/preference_controller.dart';
import '../../profile/controllers/edit_profile_controller.dart';
import '../../../../../core/constants/app_config.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.lazyPut(() => ProfileController());
    Get.put(Cloudinary.full(
        cloudName: AppConfig.cloudName,
        apiKey: AppConfig.cloudApiKey,
        apiSecret: AppConfig.cloudApiSecret));
    Get.put(
      PreferenceController(),
    );
    Get.lazyPut<PreferenceController>(
      () => PreferenceController(),
    );
    Get.put(EditProfileController());
    Get.lazyPut(() => EditProfileController());
  }
}
