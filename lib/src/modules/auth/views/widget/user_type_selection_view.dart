import '../../../../core/app_export.dart';
import '../../controllers/login_controller.dart';

class UserTypeSelectionView extends GetView<LoginController> {
  const UserTypeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "User type selection section".tr,
            style: TextStyleX.subHeading2(context).copyWith(
                color: AppColor.lightBlueGrey,
                fontSize: AppTextSizes.headerText3()),
          ),
          SizedBox(height: AppRatioSize.getRatioHeight() / 200),
          Obx(() {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: controller.onUserSelection,
                  child: Container(
                    width: AppRatioSize.getRatioWidth() / 4.5,
                    height: AppRatioSize.getRatioHeight() / 24,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        color: controller.isUserSelected.value
                            ? AppColor.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2)),
                    alignment: Alignment.center,
                    child: Text("User",
                        style: TextStyleX.subHeading2(context).copyWith(
                          color: controller.isUserSelected.value
                              ? AppColor.white
                              : AppColor.primary,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: controller.onAdminSelection,
                  child: Container(
                    width: AppRatioSize.getRatioWidth() / 4.5,
                    height: AppRatioSize.getRatioHeight() / 24,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        color: controller.isAdminSelected.value
                            ? AppColor.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2)),
                    alignment: Alignment.center,
                    child: Text("Admin",
                        style: TextStyleX.subHeading2(context).copyWith(
                          color: controller.isAdminSelected.value
                              ? AppColor.white
                              : AppColor.secondaryGreyColor,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: controller.onTrainerSelection,
                  child: Container(
                    width: AppRatioSize.getRatioWidth() / 4.5,
                    height: AppRatioSize.getRatioHeight() / 24,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        color: controller.isTrainerSelected.value
                            ? AppColor.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2)),
                    alignment: Alignment.center,
                    child: Text("Trainer",
                        style: TextStyleX.subHeading2(context).copyWith(
                          color: controller.isTrainerSelected.value
                              ? AppColor.white
                              : AppColor.secondaryGreyColor,
                        )),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
