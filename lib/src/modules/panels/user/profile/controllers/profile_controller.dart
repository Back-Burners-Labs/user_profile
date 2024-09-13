import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/snackbar.dart';
import '../../../../../modules/auth/controllers/login_controller.dart';
import '../../../../../data/dataSource/local/profile_option_data.dart';
import '../../../../../modules/auth/bindings/auth_binding.dart';
import '../../../../../modules/auth/views/login/login_view.dart';
import '../../../../../theme/controller/theme_controller.dart';
import '../../../../../core/models/profile_option_model.dart';
import '../../../../../core/models/setting_option_model.dart';
import '../../../../../core/models/user.dart';

class ProfileController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();
  RxBool isDarkMode = false.obs;
  final Rx<String> _currentModeName = ''.obs;
  RxList<ProfileOptionModel> profileOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> settingOptions = <ProfileOptionModel>[].obs;
  RxInt myRegularChallengeIndex = 0.obs;
  RxInt myNutritionChallengeIndex = 0.obs;
  RxBool isExerciseSelected = true.obs;
  RxList<OptionModel> appLanguageData = [
    OptionModel(true, 'English', "en_US"),
    OptionModel(false, 'Spanish', "es_ES"),
    OptionModel(false, 'Hindi', "hi_IN"),
    OptionModel(false, 'German', "gr_DE"),
    OptionModel(false, 'Arabic', "ar_AE"),
    OptionModel(false, 'French', "fr_FR"),
  ].obs;
  Rx<OptionModel> appLanguageSelected = OptionModel(false, "", "").obs;

  String get username => "${user?.firstName ?? ''} ${user?.lastName ?? ''}";

  User? get user => Get.find<LoginController>().user();

  @override
  void onInit() {
    isDarkMode.value = _themeController.isDarkTheme;
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    profileOptions.value = getProfileOptionData();
    settingOptions.value = getSettingOptionData();
    _getAppLocal();
    super.onInit();
  }

  _getAppLocal() async {
    Locale locale = await _themeController.getLocale();
    appLanguageSelected.value = appLanguageData.firstWhere((element) =>
        element.description == "${locale.languageCode}_${locale.countryCode}");
    for (var element in appLanguageData) {
      if (element == appLanguageSelected.value) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    appLanguageData.refresh();
  }

  void changeLanguage() {
    String languageCode = appLanguageSelected.value.description.split("_")[0];
    String countryCode = appLanguageSelected.value.description.split("_")[1];
    Locale locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    _themeController.setLocale(locale);
    SnackBarX.showSuccess(
        title: "lbl_language_change".tr,
        message:
            "lbl_language_change_message".tr + appLanguageSelected.value.text);
  }

  bool toggleTheme() {
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    _changeTheme();
    return isDarkMode.value;
  }

  void _changeTheme() {
    _themeController.changeTheme(
      isDarkMode: isDarkMode,
      modeName: _currentModeName,
    );
    isDarkMode.value = _themeController.isDarkTheme;
  }

  void logoutPressed() {
    Get.offAll(() => const LoginView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

}
