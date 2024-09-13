import 'dart:io';

import '../../../../../core/app_export.dart';
import '../../../../../core/reusableComponents/app_key_value_widget.dart';
import '../../../global_widgets/overview_container_widget.dart';
import '../controllers/preference_controller.dart';

class OverViewView extends GetView<PreferenceController> {
  const OverViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          AppRatioSpaces.verticalSectionSpaceMF(),
          _profileInfoWidget(context),
          _basicInfoWidget(),
          _preferenceInfoWidget(),
          _trainingDayWidget(context)
        ],
      ),
    );
  }

  Widget _profileInfoWidget(BuildContext context) {
    return OverviewContainerWidget(
      child: Row(
        children: [
          _profileImageWidget(context),
          AppRatioSpaces.horizontalSectionSpaceXS(),
          Text(
            "${controller.firstNameTextController.text} ${controller.lastNameTextController.text}"
                .tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading3(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _profileImageWidget(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioWidth() / 8.5,
      width: AppRatioSize.getRatioWidth() / 8.5,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.grey.withOpacity(0.3)
              : AppColor.darkGrey,
          borderRadius: BorderRadius.circular(Get.width),
          border: Border.all(color: AppColor.primary, width: 2)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(Get.width),
          child: controller.selectedProfileImagePath.value == ""
              ? Icon(
                  Icons.person,
                  color: AppColor.primary,
                  size: AppRatioSize.getRatioWidth() / 12,
                )
              : Image.file(
                  File(controller.selectedProfileImagePath.value),
                  fit: BoxFit.cover,
                )),
    );
  }

  Widget _basicInfoWidget() {
    return OverviewContainerWidget(
      child: Column(
        children: [
          AppKeyValueRowWidget(
            rowKey: "Age",
            value: controller.currentAgeValue.value.toString(),
          ),
          controller.isHeightTabOneSelected.value
              ? AppKeyValueRowWidget(
                  rowKey: "Height",
                  value: "${controller.currentHeightCmValue.value} cm",
                )
              : AppKeyValueRowWidget(
                  rowKey: "Height",
                  value:
                      "${controller.currentHeightFtValue.value}' ${controller.currentHeightInchValue.value}\"",
                ),
          controller.isWeightTabOneSelected.value
              ? AppKeyValueRowWidget(
                  rowKey: "Weight",
                  value: "${controller.currentWeightValue.value} Lbs",
                )
              : AppKeyValueRowWidget(
                  rowKey: "Weight",
                  value: "${controller.currentWeightValue.value} Kgs",
                ),
          AppKeyValueRowWidget(
            rowKey: "Sleep Time",
            value: "${controller.currentSleepHoursValue.value} Hrs",
          ),
        ],
      ),
    );
  }

  Widget _preferenceInfoWidget() {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.selectedPreferenceList.length,
          itemBuilder: (context, index) {
            return OverviewContainerWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.selectedPreferenceList[index].title}".tr,
                    style: TextStyleX.subHeading1(context),
                  ),
                  "${controller.selectedPreferenceList[index].desc}".tr == ""
                      ? Container()
                      : AppRatioSpaces.verticalSectionSpaceXXXS(),
                  "${controller.selectedPreferenceList[index].desc}".tr == ""
                      ? Container()
                      : Text(
                          "${controller.selectedPreferenceList[index].desc}".tr,
                          style: TextStyleX.subHeading1(context).copyWith(
                              color: AppColor.grey,
                              fontSize: AppTextSizes.headerText4()),
                        ),
                ],
              ),
            );
          });
    });
  }

  Widget _trainingDayWidget(BuildContext context) {
    return Obx(() {
      return OverviewContainerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "selected_training_days".tr,
              style: TextStyleX.subHeading1(context).copyWith(
                color: AppColor.grey.withOpacity(0.8),
              ),
            ),
            Wrap(
              children: _trainingDayTextWidgets(context),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _trainingDayTextWidgets(BuildContext context) {
    List<Widget> textWidgets = [];
    for (int i = 0;
        i < controller.selectedPreferenceTrainingDayList.length;
        i++) {
      textWidgets.add(
        Text(
          "${"${controller.selectedPreferenceTrainingDayList[i].title}".tr}${i < controller.selectedPreferenceTrainingDayList.length - 1 ? ", " : ""}",
          style: TextStyleX.subHeading1(context),
        ),
      );
    }
    return textWidgets;
  }
}
