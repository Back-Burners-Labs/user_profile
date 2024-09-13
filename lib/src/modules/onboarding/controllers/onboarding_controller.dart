import '../../../core/app_export.dart';
import '../../auth/views/registration/registration_view.dart';
import '../../../data/dataSource/local/onboarding_data.dart';
import '../../auth/bindings/auth_binding.dart';
import '../../auth/views/login/login_view.dart';

class OnBoardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<OnBoardingModel> onBoardings = getOnBoardingData();
  Rx<int> sliderIndex = 0.obs;
  AnimationController? animationController;
  late Animation<Offset> introductionAnimation,
      firstSectionAnimationOB1,
      secondSectionAnimationOB1,
      firstInnerSectionAnimationOB1,
      secondInnerSectionAnimationOB1,
      thirdInnerSectionAnimationOB1,
      firstSectionAnimationOB2,
      secondSectionAnimationOB2,
      firstInnerSectionAnimationOB2,
      secondInnerSectionAnimationOB2,
      thirdInnerSectionAnimationOB2,
      firstSectionAnimationOB3,
      secondSectionAnimationOB3,
      firstInnerSectionAnimationOB3,
      secondInnerSectionAnimationOB3,
      thirdInnerSectionAnimationOB3,
      forthInnerSectionAnimationOB3,
      firstSectionAnimationFinal,
      secondSectionAnimationFinal,
      firstInnerSectionAnimationFinal,
      onBoardingTopSectionAnimation,
      backButtonAnimation,
      skipButtonAnimation,
      nextButtonAnimation,
      loginTextButtonAnimation;
  late Animation<double> signUpButtonAnimation;
  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    animationController?.animateTo(0.2);

    introductionAnimation = _introductionAnimation();
    firstSectionAnimationOB1 = _firstSectionAnimationOB1();
    secondSectionAnimationOB1 = _secondSectionAnimationOB1();
    thirdInnerSectionAnimationOB1 = _thirdInnerSectionAnimationOB1();
    firstInnerSectionAnimationOB1 = _firstInnerSectionAnimationOB1();
    secondInnerSectionAnimationOB1 = _secondInnerSectionAnimationOB1();

    firstSectionAnimationOB2 = _firstSectionAnimationOB2();
    secondSectionAnimationOB2 = _secondSectionAnimationOB2();
    firstInnerSectionAnimationOB2 = _firstInnerSectionAnimationOB2();
    secondInnerSectionAnimationOB2 = _secondInnerSectionAnimationOB2();
    thirdInnerSectionAnimationOB2 = _thirdInnerSectionAnimationOB2();

    firstSectionAnimationOB3 = _firstSectionAnimationOB3();
    secondSectionAnimationOB3 = _secondSectionAnimationOB3();
    firstInnerSectionAnimationOB3 = _firstInnerSectionAnimationOB3();
    secondInnerSectionAnimationOB3 = _secondInnerSectionAnimationOB3();
    thirdInnerSectionAnimationOB3 = _thirdInnerSectionAnimationOB3();
    forthInnerSectionAnimationOB3 = _forthInnerSectionAnimationOB3();

    firstSectionAnimationFinal = _firstSectionAnimationFinal();
    secondSectionAnimationFinal = _secondSectionAnimationFinal();
    firstInnerSectionAnimationFinal = _firstInnerSectionAnimationFinal();
    onBoardingTopSectionAnimation = _onboardingTopSectionAnimation();
    backButtonAnimation = _backButtonAnimation();
    skipButtonAnimation = _skipButtonAnimation();
    nextButtonAnimation = _nextButtonAnimation();
    signUpButtonAnimation = _signUpButtonAnimation();
    loginTextButtonAnimation = _loginTextButtonAnimation();
    super.onInit();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }

  void onSkipClick() {
    animationController?.animateTo(0.8,
        duration: const Duration(milliseconds: 500));
  }

  void onBackClick() {
    if (animationController!.value > 0.2 && animationController!.value <= 0.4) {
      animationController?.animateTo(0.2);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.7) {
      animationController?.animateTo(0.4);
    } else if (animationController!.value >= 0.8) {
      animationController?.animateTo(0.6);
    }
  }

  void onNextClick() {
    if (animationController!.value >= 0 && animationController!.value <= 0.2) {
      animationController?.animateTo(0.4);
    } else if (animationController!.value > 0.2 &&
        animationController!.value <= 0.4) {
      animationController?.animateTo(0.6);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.7) {
      animationController?.animateTo(0.8);
    } else if (animationController!.value >= 0.8) {
      signUpClick();
    }
  }

  void onLetsGo() {
    animationController!.animateTo(0.2);
  }

  void signUpClick() {
    Get.off(() => const RegistrationView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 600),
        transition: Transition.circularReveal);
  }

  onLoginClick() {
    Get.off(() => const LoginView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.circularReveal);
  }

  _introductionAnimation() {
    return Tween<Offset>(
        begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _firstSectionAnimationOB1() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _secondSectionAnimationOB1() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _thirdInnerSectionAnimationOB1() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _firstInnerSectionAnimationOB1() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _secondInnerSectionAnimationOB1() {
    return Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _firstSectionAnimationOB2() {
    return Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _secondSectionAnimationOB2() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _firstInnerSectionAnimationOB2() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-6, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.8,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _secondInnerSectionAnimationOB2() {
    return Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _thirdInnerSectionAnimationOB2() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _firstInnerSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(4, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _secondInnerSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _firstSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _secondSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _thirdInnerSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _forthInnerSectionAnimationOB3() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _firstSectionAnimationFinal() {
    return Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _secondSectionAnimationFinal() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
        .animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  _firstInnerSectionAnimationFinal() {
    return Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _onboardingTopSectionAnimation() {
    return Tween<Offset>(
        begin: const Offset(0, -1), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _backButtonAnimation() {
    return Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _skipButtonAnimation() {
    return Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(3, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _nextButtonAnimation() {
    return Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _signUpButtonAnimation() {
    return Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }

  _loginTextButtonAnimation() {
    return Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController!,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
  }
}
