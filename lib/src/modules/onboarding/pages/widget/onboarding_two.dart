import '../../../../core/app_export.dart';
import '../../../../data/dataSource/local/onboarding_data.dart';
import '../../../onboarding/controllers/onBoarding_controller.dart';
import '../../../onboarding/pages/widget/back_shadow.dart';
import 'onBoarding_detail_container.dart';

class OnBoardingTwo extends GetView<OnBoardingController> {
  final OnBoardingModel onBoarding;
  const OnBoardingTwo({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SlideTransition(
        position: controller.firstSectionAnimationOB2,
        child: SlideTransition(
          position: controller.secondSectionAnimationOB2,
          child: Stack(
            children: [
              SlideTransition(
                position: controller.firstSectionAnimationOB2,
                child: SlideTransition(
                  position: controller.secondSectionAnimationOB2,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.asset(
                      onBoarding.imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              const BackShadow(),
              OnBoardingDetailsContainer(
                onBoarding: onBoarding,
                animationOffset1: controller.secondInnerSectionAnimationOB2,
                animationOffset2: controller.thirdInnerSectionAnimationOB2,
                animationOffset3: controller.secondSectionAnimationOB2,
                animationOffset4: controller.firstInnerSectionAnimationOB2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
