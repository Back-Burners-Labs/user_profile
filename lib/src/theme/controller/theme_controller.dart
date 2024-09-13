import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  late bool isDarkTheme;
  late bool themeHiveSetting;

  final Box<dynamic> settingsHiveBox = Hive.box('settings');

  ThemeMode get themeStateFromHiveSettingBox =>
      _getThemeFromHiveBox() ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    isDarkTheme = _getThemeFromHiveBox();
    super.onInit();
  }

  bool _getThemeFromHiveBox() {
    themeHiveSetting =
        settingsHiveBox.get('isDarkMode', defaultValue: Get.isDarkMode);
    return themeHiveSetting;
  }

  void _updateHiveThemeSetting(bool boolData) {
    settingsHiveBox.put('isDarkMode', boolData);
  }

  void changeTheme({
    required RxBool isDarkMode,
    required Rx<String> modeName,
  }) {
    if (Get.isDarkMode) {
      modeName.value = 'light';
      isDarkMode.value = false;
      isDarkTheme = false;
      _updateHiveThemeSetting(false);
      _changeThemeMode(ThemeMode.light);
    } else {
      modeName.value = 'dark';
      isDarkMode.value = true;
      isDarkTheme = true;
      _updateHiveThemeSetting(true);
      _changeThemeMode(ThemeMode.dark);
    }
  }

  void _changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  setLocale(Locale locale) async {
    settingsHiveBox.put('currentLocal', "${locale.languageCode}_${locale.countryCode}");
  }

  Future<Locale> getLocale() async {
    String languageCode =
    settingsHiveBox.get('currentLocal',defaultValue: "en_US");
    return Locale(languageCode.split("_")[0],languageCode.split("_")[1]);
  }
}
