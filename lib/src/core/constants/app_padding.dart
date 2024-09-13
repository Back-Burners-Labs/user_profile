import '../app_export.dart';

class AppPaddings {
  static EdgeInsets bottomBarButton() {
    return EdgeInsets.only(
      left: AppRatioSize.getRatioWidth() / 16,
      right: AppRatioSize.getRatioWidth() / 16,
      bottom: AppRatioSize.getRatioHeight() / 44,
      top: AppRatioSize.getRatioHeight() / 88,
    );
  }

  static EdgeInsets bottomBarButton2() {
    return EdgeInsets.only(
      left: AppRatioSize.getRatioWidth() / 24,
      right: AppRatioSize.getRatioWidth() / 24,
      bottom: AppRatioSize.getRatioHeight() / 44,
      top: AppRatioSize.getRatioHeight() / 88,
    );
  }

  static EdgeInsets splashLogo() {
    return EdgeInsets.symmetric(
      horizontal: Get.width / 4.5,
    );
  }

  static EdgeInsets fullViewContainer() {
    return EdgeInsets.symmetric(
      horizontal: Get.width / 3.5,
    );
  }

  static EdgeInsets radioOption() {
    return EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 44,
        vertical: AppRatioSize.getRatioHeight() / 88);
  }

  static EdgeInsets horizontalPaddingMargin() {
    return EdgeInsets.symmetric(
      horizontal: AppRatioSize.getRatioWidth() / 16,
    );
  }
}
