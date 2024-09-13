import '../../../../core/app_export.dart';
import '../../../../data/dataSource/local/onboarding_data.dart';
import '../../../onboarding/controllers/onBoarding_controller.dart';
import '../../../onboarding/pages/widget/back_shadow.dart';
import 'onBoarding_detail_container.dart';

class OnBoardingFour extends GetView<OnBoardingController> {
  final OnBoardingModel onBoarding;
  const OnBoardingFour({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SlideTransition(
        position: controller.firstSectionAnimationFinal,
        child: SlideTransition(
          position: controller.secondSectionAnimationFinal,
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onBoarding.imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                const BackShadow(),
                OnBoardingDetailsContainer(
                  onBoarding: onBoarding,
                  animationOffset1: controller.firstInnerSectionAnimationFinal,
                  animationOffset2: controller.firstInnerSectionAnimationFinal,
                  animationOffset3: controller.firstInnerSectionAnimationFinal,
                  animationOffset4: controller.firstInnerSectionAnimationFinal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
