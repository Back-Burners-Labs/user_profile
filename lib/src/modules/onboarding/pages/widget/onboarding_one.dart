import '../../../../core/app_export.dart';
import '../../../../data/dataSource/local/onboarding_data.dart';
import '../../../onboarding/controllers/onBoarding_controller.dart';
import '../../../onboarding/pages/widget/back_shadow.dart';
import 'onBoarding_detail_container.dart';

class OnBoardingOne extends GetView<OnBoardingController> {
  final OnBoardingModel onBoarding;
  const OnBoardingOne({super.key, required this.onBoarding});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SlideTransition(
        position: controller.firstSectionAnimationOB1,
        child: SlideTransition(
          position: controller.secondSectionAnimationOB1,
          child: Stack(
            children: [
              SlideTransition(
                position: controller.firstInnerSectionAnimationOB1,
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
              const BackShadow(),
              OnBoardingDetailsContainer(
                onBoarding: onBoarding,
                animationOffset1: controller.firstInnerSectionAnimationOB1,
                animationOffset2: controller.secondInnerSectionAnimationOB1,
                animationOffset3: controller.secondInnerSectionAnimationOB1,
                animationOffset4: controller.thirdInnerSectionAnimationOB1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
