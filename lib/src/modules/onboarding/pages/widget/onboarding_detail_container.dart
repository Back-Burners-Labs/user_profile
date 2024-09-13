import '../../../../core/app_export.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../data/dataSource/local/onboarding_data.dart';
import '../../controllers/onBoarding_controller.dart';

class OnBoardingDetailsContainer extends GetView<OnBoardingController> {
  final OnBoardingModel onBoarding;
  final Animation<Offset> animationOffset1;
  final Animation<Offset> animationOffset2;
  final Animation<Offset> animationOffset3;
  final Animation<Offset> animationOffset4;

  const OnBoardingDetailsContainer(
      {super.key,
        required this.onBoarding,
        required this.animationOffset1,
        required this.animationOffset2,
        required this.animationOffset3,
        required this.animationOffset4});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          const Spacer(),
          SlideTransition(
            position: animationOffset1,
            child: SlideTransition(
                position: animationOffset2,
                child: _titleTextContainer(context, onBoarding)),
          ),
          SlideTransition(
            position: animationOffset3,
            child: SlideTransition(
                position: animationOffset4,
                child: _subtitleTextContainer(context, onBoarding)),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXL()
        ],
      ),
    );
  }

  _titleTextContainer(BuildContext context, OnBoardingModel onBoarding) {
    return Text(
      onBoarding.title.tr,
      style: TextStyle(
          color: AppColor.primary.withOpacity(1),
          fontFamily: AppFonts.titles,
          fontSize: 24
      ),
    );
  }

  _subtitleTextContainer(BuildContext context, OnBoardingModel onBoarding) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
      child: Text(
        onBoarding.desc.tr,
        style: TextStyle(
            color: AppColor.white.withOpacity(1),
            fontFamily: AppFonts.contents,
            fontSize: 18
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
