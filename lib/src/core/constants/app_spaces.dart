import '../app_export.dart';

class AppRatioSpaces {
  static Widget appbarToTitle() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 88,
    );
  }

  static Widget titleToNext() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 88,
    );
  }

  static Widget verticalSectionSpaceXXXL() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 6,
    );
  }

  static Widget verticalSectionSpaceXXL() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 8,
    );
  }

  static Widget verticalSectionSpaceXL() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 12,
    );
  }

  static Widget verticalSectionSpaceL() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 18,
    );
  }

  static Widget verticalSectionSpaceLF() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 24,
    );
  }

  static Widget verticalSectionSpaceMF() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 32,
    );
  }

  static Widget verticalSectionSpaceM() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 44,
    );
  }

  static Widget verticalSectionSpaceMTF() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 55,
    );
  }

  static Widget verticalSectionSpaceS() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 66,
    );
  }

  static Widget verticalSectionSpaceXS() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 88,
    );
  }

  static Widget verticalSectionSpaceXXS() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 120,
    );
  }

  static Widget verticalSectionSpaceXXXS() {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 150,
    );
  }

  static Widget horizontalSectionSpaceM() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 12,
    );
  }

  static Widget horizontalSectionSpaceS() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 28,
    );
  }

  static Widget horizontalSectionSpaceXS() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 32,
    );
  }

  static Widget horizontalSectionSpaceXXS() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 44,
    );
  }

  static Widget horizontalSectionSpaceXXSS() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 66,
    );
  }

  static Widget horizontalSectionSpaceXXXS() {
    return SizedBox(
      width: AppRatioSize.getRatioWidth() / 120,
    );
  }

  static Widget horizontalSectionSpaceS1() {
    return const SizedBox(
      width: 2,
    );
  }
}

class AppFullSpaces {
  static Widget appHorizontalSpacer1() {
    return SizedBox(
      width: Get.width / 3.5,
    );
  }

  static Widget appVerticalSpacer1() {
    return SizedBox(
      height: Get.height / 32,
    );
  }

  static Widget appVerticalSpacer6() {
    return SizedBox(height: Get.height / 66);
  }
}
