
import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';
import 'widgets/scale_widget.dart';

class HeightInputView extends GetView<PreferenceController> {
  const HeightInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: Get.width,
      // padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Obx(() {
            return Column(
              children: [
                Obx(() {
                  return AppTabBar(onChange: (value) {
                    controller.isHeightTabOneSelected.value = value;
                  },
                      isFirstOptionSelected: controller
                          .isHeightTabOneSelected.value,
                      optionOneText: "Cm",
                      optionTwoText: "Ft");
                }),
                AppRatioSpaces.verticalSectionSpaceLF(),
                controller.isHeightTabOneSelected.value ?
                _cmSelectorWidget(context)
                    :
                _feetSelectorWidget(context)
              ],
            );
          }),
          AppRatioSpaces.verticalSectionSpaceL(),
          Obx(() {
            return controller.isHeightTabOneSelected.value ?
            _cmTextViewWidget(context)
                :
            _feetTextViewWidget(context);
          }),
        ],
      ),
    );
  }

  Widget _cmSelectorWidget(BuildContext context) {
    return ScaleWidget(
      scaleController: controller.cmScaleController,
      scaleIntList: controller.cmList,
      scaleType: "",
      onChange: (value) {
        controller.currentHeightCmValue.value = value;
      },
    );
  }

  Widget _cmTextViewWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${controller.currentHeightCmValue.value}".tr,
          textAlign: TextAlign.center,
          style: TextStyleX.header2(context).copyWith(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.creamColor,),
        ),
        Text(
          " cm".tr,
          textAlign: TextAlign.center,
          style: TextStyleX.header2(context).copyWith(
              color: AppColor.primary,),
        ),
      ],
    );
  }

  Widget _feetSelectorWidget(BuildContext context) {
    return Column(
      children: [
        ScaleWidget(
          scaleController: controller.feetScaleController,
          scaleIntList: controller.feetList,
          scaleType: "ft",
          onChange: (value) {
            controller.currentHeightFtValue.value = value;
          },
        ),
        SizedBox(height: AppRatioSize.getRatioHeight() / 48,),
        ScaleWidget(
          scaleController: controller.inchesScaleController,
          scaleIntList: controller.inchesList,
          scaleType: "in",
          onChange: (value) {
            controller.currentHeightInchValue.value = value;
          },
        )
      ],
    );
  }

  Widget _feetTextViewWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "${controller.currentHeightFtValue.value}".tr,
              textAlign: TextAlign.center,
              style: TextStyleX.header2(context).copyWith(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.creamColor,),
            ),
            Text(
              "ft".tr,
              textAlign: TextAlign.center,
              style: TextStyleX.header2(context).copyWith(
                  color: AppColor.primary,),
            ),
          ],
        ),
        const SizedBox(width: 4,),
        Row(
          children: [
            Text(
              "${controller.currentHeightInchValue.value}".tr,
              textAlign: TextAlign.center,
              style: TextStyleX.header2(context).copyWith(
                  color: Theme
                      .of(context)
                      .brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.creamColor,),
            ),
            Text(
              "inch".tr,
              textAlign: TextAlign.center,
              style: TextStyleX.header2(context).copyWith(
                  color: AppColor.primary,),
            ),
          ],
        ),
      ],
    );
  }
}
