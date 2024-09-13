import 'package:user_profile/src/core/app_export.dart';

import '../../controllers/preference_controller.dart';

class PreferenceStepper extends GetView<PreferenceController> {
  const PreferenceStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 24),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.preferenceWidgets.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() {
              return SizedBox(
                width: Get.width / (controller.preferenceWidgets.length + 0.5),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(controller.currentIndex < index + 1
                          ? controller.currentIndex.value == index
                              ? AppIcon.stepIcon
                              : AppIcon.stepIncompleteIcon
                          : AppIcon.checkIcon),
                      width: AppRatioSize.getRatioWidth() / 24,
                      color: controller.currentIndex >= index
                          ? AppColor.primary
                          : AppColor.grey,
                    ),
                    index == (controller.preferenceWidgets.length - 1)
                        ? Container()
                        : Expanded(
                            child: Container(
                            height: 1.5,
                            color: controller.currentIndex > index
                                ? AppColor.primary
                                : AppColor.grey,
                          ))
                  ],
                ),
              );
            });
          }),
    );
  }
}
