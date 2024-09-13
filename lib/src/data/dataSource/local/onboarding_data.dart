import '../../../core/app_export.dart';

class OnBoardingModel{
  int id;
  String title;
  String desc;
  String imagePath;
  String buttonText;
  String floatingTextImagePath;
  String floatingLogoImagePath;
  String floatingShapeImagePath;
  String floatingText;

  OnBoardingModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.imagePath,
    required this.buttonText,
    required this.floatingTextImagePath,
    required this.floatingLogoImagePath,
    required this.floatingShapeImagePath,
    required this.floatingText,
  });

}

List<OnBoardingModel> getOnBoardingData() {
  final List<OnBoardingModel> onBoardings = [
    OnBoardingModel(
        id: 0,
        title: "onBoarding_one_title",
        imagePath: AppImage.onBoarding1Bg,
        desc: "onBoarding_one_desc",
        buttonText: "onBoarding_one_button_text",
        floatingLogoImagePath: AppImage.logoDark,
        floatingShapeImagePath: "",
      floatingText: "onBoarding_one_floating_text",
      floatingTextImagePath: ""
    ),
    OnBoardingModel(
        id: 1,
        title: "onBoarding_two_title",
        imagePath: AppImage.onBoarding2Bg,
        desc: "onBoarding_two_desc",
        buttonText: "onBoarding_two_button_text",
        floatingLogoImagePath: AppImage.logoDark,
        floatingShapeImagePath: "",
        floatingText: "onBoarding_two_floating_text",
        floatingTextImagePath: ""
    ),
    OnBoardingModel(
        id: 2,
        title: "onBoarding_three_title",
        imagePath: AppImage.onBoarding3Bg,
        desc: "onBoarding_three_desc",
        buttonText: "onBoarding_three_button_text",
        floatingLogoImagePath: "",
        floatingShapeImagePath: AppImage.onBoardingShape,
        floatingText: "onBoarding_three_floating_text",
        floatingTextImagePath: AppImage.onBoarding3TextImage
    ),
    OnBoardingModel(
        id: 4,
        title: "onBoarding_four_title",
        imagePath: AppImage.onBoarding5Bg,
        desc: "onBoarding_four_desc",
        buttonText: "onBoarding_five_button_text",
        floatingLogoImagePath: "",
        floatingShapeImagePath: "",
        floatingText: "",
        floatingTextImagePath: AppImage.onBoarding5TextImage
    ),

  ];

  return onBoardings;
}