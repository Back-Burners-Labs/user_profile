import '../../../../core/app_export.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../controllers/onBoarding_controller.dart';

class SkipBackButton extends GetView<OnBoardingController> {
  const SkipBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.onBoardingTopSectionAnimation,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: 58,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _backButton(),
              _skipButton(context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _backButton(){
    return SlideTransition(
      position: controller.backButtonAnimation,
      child:AnimatedBuilder(
          animation: controller.animationController!,
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: controller.animationController!.value >= 0.4
                  ? 1
                  : 0,
              duration: const Duration(milliseconds: 480),
              child: IconButton(
                onPressed: (){
                  controller.onBackClick();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,color: AppColor.creamColor,),
                //   ),
              ),
            );
          }
      ),
    );
  }
  
  Widget _skipButton(BuildContext context){
    return Directionality.of(context)==TextDirection.rtl?Container(
      margin: EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth()/24),
      child: GestureDetector(
        onTap: controller.onSkipClick,
        child: Text('lbl_skip'.tr,
          maxLines: 1,
          style: TextStyleX.header5(context).copyWith(
            color: AppColor.white,
            fontFamily: AppFonts.buttons
          ),
        ),
      ),
    ): SlideTransition(
      position: controller.skipButtonAnimation,
      child: AnimatedBuilder(
        animation: controller.animationController!,
        builder: (context, child) {
          return AnimatedOpacity(
            opacity: controller.animationController!.value <= 0.6
                ? 1
                : 0,
            duration: const Duration(milliseconds: 480),
            child: GestureDetector(
              onTap: controller.onSkipClick,
              child: Text('lbl_skip'.tr,
                maxLines: 1,
                style: TextStyleX.header5(context).copyWith(
                    color: AppColor.white,
                    fontFamily: AppFonts.buttons
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
