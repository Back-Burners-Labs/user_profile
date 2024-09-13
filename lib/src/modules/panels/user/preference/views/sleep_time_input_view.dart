import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';
import 'widgets/scale_widget.dart';

class SleepInputView extends GetView<PreferenceController> {
  const SleepInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: Get.width,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _sleepDurationSelectorWidget(),
          AppRatioSpaces.verticalSectionSpaceL(),
          _sleepTextViewWidget(context),
        ],
      ),
    );
  }
  Widget _sleepDurationSelectorWidget(){
    return Column(
      children: [
        AppRatioSpaces.verticalSectionSpaceLF(),
        ScaleWidget(
          scaleController: controller.hrScaleController,
          scaleIntList: controller.hrList,
          scaleType: "",
          onChange: (value) {
            controller.currentSleepHoursValue.value=value;
          },
        )
      ],
    );
  }

  Widget _sleepTextViewWidget(BuildContext context){
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${controller.currentSleepHoursValue.value}".tr,
            textAlign: TextAlign.center,
            style: TextStyleX.header1(context).copyWith(
                color: Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.creamColor,),
          ),
          Text(
            " Hrs".tr,
            textAlign: TextAlign.center,
            style: TextStyleX.header1(context).copyWith(
                color: AppColor.primary,),
          ),
        ],
      );
    });
  }
}
