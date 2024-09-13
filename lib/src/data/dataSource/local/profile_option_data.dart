import '../../../core/app_export.dart';
import '../../../modules/auth/bindings/auth_binding.dart';
import '../../../modules/auth/views/additional/change_password_view.dart';
import '../../../modules/panels/user/profile/views/edit_profile_view.dart';
import '../../../core/models/profile_option_model.dart';

List<ProfileOptionModel> getProfileOptionData() {
  final List<ProfileOptionModel> profileOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.profileEditIcon,
        name: "edit_profile_title",
        desc: "",
        action: () {
          Get.to(() => const EditProfileView(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColor.lightBlueGrey,
        )),
  ];

  return profileOptionData;
}

List<ProfileOptionModel> getSettingOptionData() {
  final List<ProfileOptionModel> settingOptionData = [
    ProfileOptionModel(
      id: 1,
      iconPath: AppIcon.passwordIcon,
      name: "password_text",
      desc: "",
      action: () {
        Get.to(() => const ChangePasswordView(),
            binding: AuthBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.fadeIn);
      },
      iconRight: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColor.lightBlueGrey,
      ),
    ),
    ProfileOptionModel(
      id: 2,
      iconPath: AppIcon.darkModeIcon,
      name: "dark_mode_lbl",
      desc: "",
      action: () {},
      iconRight: Container(),
    ),
  ];

  return settingOptionData;
}
