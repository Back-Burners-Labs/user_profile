import '../../../../core/app_export.dart';
import '../../../../data/dataSource/local/onboarding_data.dart';
import '../../../onboarding/controllers/onBoarding_controller.dart';
import '../../../onboarding/pages/widget/back_shadow.dart';
import 'onBoarding_detail_container.dart';

class OnBoardingThree extends GetView<OnBoardingController> {
  final OnBoardingModel onBoarding;
  const OnBoardingThree({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SlideTransition(
        position: controller.firstSectionAnimationOB3,
        child: SlideTransition(
          position: controller.secondSectionAnimationOB3,
          child: Stack(
            children: [
              SlideTransition(
                position: controller.firstInnerSectionAnimationOB3,
                child: SlideTransition(
                  position: controller.secondInnerSectionAnimationOB3,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.asset(
                      onBoarding.imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
              const BackShadow(),
              OnBoardingDetailsContainer(
                onBoarding: onBoarding,
                animationOffset1: controller.secondSectionAnimationOB3,
                animationOffset2: controller.thirdInnerSectionAnimationOB3,
                animationOffset3: controller.thirdInnerSectionAnimationOB3,
                animationOffset4: controller.forthInnerSectionAnimationOB3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
