import 'package:user_profile/src/core/app_export.dart';
import 'package:user_profile/src/modules/panels/user/profile/controllers/edit_profile_controller.dart';

class EditPreferenceBottomSheet extends StatelessWidget {
  final EditProfileController controller = Get.find();

  EditPreferenceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 1.2,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Obx(() {
                  return Container(
                    height: 60,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Text(
                      controller.editPreferenceTitle.value.tr,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                        fontSize: AppTextSizes.titleText5(),
                      ),
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          right: AppRatioSize.getRatioWidth() / 32),
                      child: Icon(
                        Icons.close,
                        size: AppRatioSize.getRatioWidth() / 16,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.editPreferencePageController,
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
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: AppButton(
              action: controller.doneEditingPreference,
              text: "done_cap_lbl",
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }
}
