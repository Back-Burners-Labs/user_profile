import 'package:numberpicker/numberpicker.dart';

import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';

class AgeInputView extends GetView<PreferenceController> {
  const AgeInputView({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppRatioSpaces.verticalSectionSpaceL(),
          _agePickerWidget(context),
          AppRatioSpaces.verticalSectionSpaceL(),
          _yearRangeWidget(context)
        ],
      ),
    );
  }

  Widget _agePickerWidget(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          NumberPicker(
            value: controller.currentAgeValue.value,
            minValue: 12,
            maxValue: 100,
            step: 1,
            itemHeight: AppRatioSize.getRatioHeight() / 12,
            itemWidth: AppRatioSize.getRatioHeight() / 12,
            axis: Axis.horizontal,
            haptics: true,
            selectedTextStyle: TextStyleX.titleText5(context).copyWith(
              color: AppColor.primary,
            ),
            textStyle: TextStyleX.header3(context).copyWith(
              color: AppColor.grey,
            ),
            onChanged: (value) {
              controller.currentAgeValue.value = value;
            },
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.primary, width: 2),
            ),
          ),
        ],
      );
    });
  }

  Widget _yearRangeWidget(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Text(
            "${DateTime.now().year - controller.currentAgeValue.value - 1}  -  ${DateTime.now().year - controller.currentAgeValue.value}"
                .tr,
            textAlign: TextAlign.center,
            style: TextStyleX.titleText5(context).copyWith(
              color: AppColor.primary,
            ),
          );
        }),
        Text(
          "you_were_born_in".tr,
          textAlign: TextAlign.center,
          style: TextStyleX.subHeading3(context).copyWith(
            color: AppColor.grey,
          ),
        ),
      ],
    );
  }
}
