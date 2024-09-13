import 'package:animations/animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/app_export.dart';
import '../../controllers/onBoarding_controller.dart';

class NextButton extends GetView<OnBoardingController> {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 4,
          ),
          SlideTransition(
            position: controller.nextButtonAnimation,
            child: AnimatedBuilder(
              animation: controller.animationController!,
              builder: (context, child) => AnimatedOpacity(
                opacity: controller.animationController!.value >= 0.2 &&
                        controller.animationController!.value <= 0.8
                    ? 1
                    : 0,
                duration: const Duration(milliseconds: 480),
                child: _pageIndicatorWidget(),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SlideTransition(
            position: controller.nextButtonAnimation,
            child: AnimatedBuilder(
                animation: controller.animationController!,
                builder: (context, child) => _nextButton()),
          ),
          _finalScreenBottomLoginWidget(context)
        ],
      ),
    );
  }

  Widget _pageIndicatorWidget() {
    if (controller.animationController!.value >= 0.7) {
      controller.sliderIndex.value = 3;
    } else if (controller.animationController!.value >= 0.5) {
      controller.sliderIndex.value = 2;
    } else if (controller.animationController!.value >= 0.3) {
      controller.sliderIndex.value = 1;
    } else if (controller.animationController!.value >= 0.1) {
      controller.sliderIndex.value = 0;
    }
    return Obx(() {
      return AnimatedSmoothIndicator(
        activeIndex: controller.sliderIndex.value,
        count: 4,
        effect: SwapEffect(
          type: SwapType.yRotation,
          dotHeight: 2,
          dotColor: AppColor.white.withOpacity(1),
          activeDotColor: AppColor.primary,
          dotWidth: 40,
          radius: 0,
          strokeWidth: 25,
        ),
      );
    });
  }

  Widget _nextButton() {
    return GestureDetector(
      onTap: controller.onNextClick,
      child: Container(
        height: 58,
        width: (AppRatioSize.getRatioWidth() / 4) +
            (230 * controller.signUpButtonAnimation.value),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              8 + 32 * (1 - controller.signUpButtonAnimation.value)),
          //color: AppColor.orange,
        ),
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 480),
          reverse: controller.signUpButtonAnimation.value < 0.7,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              fillColor: Colors.transparent,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
          child: controller.signUpButtonAnimation.value > 0.7
              ? AppButton(
                  action: controller.onNextClick,
                  text: controller.onBoardings[3].buttonText,
                  boarderRadius: 4,
                )
              : AppButton(
                  action: controller.onNextClick,
                  text: "lbl_next",
                  boarderRadius: 4,
                ),
        ),
      ),
    );
  }

  _finalScreenBottomLoginWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SlideTransition(
        position: controller.loginTextButtonAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('already_have_account'.tr,
                style: TextStyleX.subHeading3(context)
            ),
            TextButton(
              onPressed: controller.onLoginClick,
              child: Text(
                'login_text'.tr,
                style: TextStyleX.subHeading1(context).copyWith(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
