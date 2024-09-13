import '../../../../../core/app_export.dart';
import '../../preference/views/widgets/preference_stepper_widget.dart';
import '../controllers/preference_controller.dart';

class PreferenceView extends GetView<PreferenceController> {
  final bool? isEditMode;

  const PreferenceView({super.key, this.isEditMode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      appBar: isEditMode == true
          ? PreferredSize(preferredSize: const Size(0, 0), child: Container())
          : AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.offWhite
                  : AppColor.blackShade,
              leading: Obx(() {
                return controller.currentIndex.value > 0
                    ? GestureDetector(
                        onTap: controller.backClick,
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.black
                                  : AppColor.creamColor,
                        ),
                      )
                    : Container();
              }),
            ),
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              isEditMode == true
                  ? AppRatioSpaces.verticalSectionSpaceM()
                  : AppFullSpaces.appVerticalSpacer6(),
              _titleBarWidget(context),
              const PreferenceStepper(),
              Expanded(
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.currentIndex.value = value;
                    },
                    itemCount: controller.preferenceWidgets.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                              child: controller.preferenceWidgets[index].widget)
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavBarButton(),
    );
  }

  _titleBarWidget(BuildContext context) {
    return Obx(() {
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 12),
        child: Text.rich(
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyleX.titleText5(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.black
                : AppColor.creamColor,
          ),
          TextSpan(
            children: [
              TextSpan(text: "${controller.preferenceQuestion.value.tr} "),
              TextSpan(
                text: controller.preferenceQuestionHighlight.value.tr,
                style: const TextStyle(color: AppColor.primary),
              ),
              const TextSpan(text: '?'),
            ],
          ),
        ),
      );
    });
  }

  _bottomNavBarButton() {
    return Container(
      margin: AppPaddings.bottomBarButton(),
      child: Hero(
        tag: "auth_button",
        child: Obx(() {
          return AppButton(
            action: controller.finishClick,
            text: controller.buttonText.value,
            fontSize: AppTextSizes.headerText(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
          );
        }),
      ),
    );
  }
}
