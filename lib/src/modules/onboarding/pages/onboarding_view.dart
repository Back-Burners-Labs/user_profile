import '../../../core/app_export.dart';
import '../controllers/onBoarding_controller.dart';
import 'widget/onBoarding_two.dart';
import 'widget/next_button.dart';
import 'widget/onBoarding_three.dart';
import 'widget/onBoarding_one.dart';
import 'widget/skip_back_button.dart';
import 'widget/onBoarding_four.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: ClipRect(
        child: Stack(
          children: [
            OnBoardingOne(onBoarding: controller.onBoardings[0]),
            OnBoardingTwo(onBoarding: controller.onBoardings[1]),
            OnBoardingThree(onBoarding: controller.onBoardings[2]),
            OnBoardingFour(onBoarding: controller.onBoardings[3]),
            const SkipBackButton(),
            const NextButton(),
          ],
        ),
      ),
    );
  }


}
