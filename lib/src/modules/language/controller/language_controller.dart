import '../../../core/app_export.dart';
import '../../../theme/controller/theme_controller.dart';
import '../../../core/models/setting_option_model.dart';

class LanguageController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();

  RxList<OptionModel> appLanguageData = [
    OptionModel(true, 'English', "en_US"),
    /*OptionModel(false, 'Spanish', "es_ES"),
    OptionModel(false, 'Hindi', "hi_IN"),
    OptionModel(false, 'German', "gr_DE"),
    OptionModel(false, 'Arabic', "ar_AE"),
    OptionModel(false, 'French', "fr_FR"),*/
  ].obs;
  Rx<OptionModel> appLanguageSelected = OptionModel(false, "", "").obs;

  @override
  void onInit() {
    getAppLocal();
    super.onInit();
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

  getAppLocal() async {
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
}
