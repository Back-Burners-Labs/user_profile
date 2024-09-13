import 'package:flutter/cupertino.dart';
import '../../../../../modules/language/view/language_view.dart';
import '../../../../../modules/panels/global_widgets/app_signature_widget.dart';
import '../../../../../modules/panels/global_widgets/profile_item_widget.dart';
import '../../../../../modules/panels/global_widgets/profile_option_widget.dart';
import '../../../../../modules/panels/global_widgets/app_bar_widget.dart';
import '../../../../../core/app_export.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: "my_profile_lbl",
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            AppRatioSpaces.verticalSectionSpaceM(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageSelectionWidget(context),
                AppRatioSpaces.verticalSectionSpaceXS(),
                Text(
                  controller.username,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.blackShade
                            : AppColor.creamColor,
                        fontSize: AppTextSizes.headerText(),
                      ),
                ),
              ],
            ),
            AppRatioSpaces.verticalSectionSpaceM(),
            ProfileItemWidget(
              title: "account_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.profileOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.profileOptions[index],
                        isLast: index == (controller.profileOptions.length - 1),
                        rightWidget:
                            controller.profileOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            ProfileItemWidget(
              title: "setting_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.settingOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.settingOptions[index],
                        isLast: index == (controller.settingOptions.length - 1),
                        rightWidget:
                            index == (controller.settingOptions.length - 1)
                                ? SizedBox(
                                    height: AppRatioSize.getRatioWidth() / 16,
                                    width: AppRatioSize.getRatioWidth() / 8,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CupertinoSwitch(
                                        value: controller.isDarkMode.value,
                                        activeColor: AppColor.primary,
                                        onChanged: (value) {
                                          controller.toggleTheme();
                                        },
                                      ),
                                    ))
                                : controller.settingOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            const LanguageView(),
            AppRatioSpaces.verticalSectionSpaceM(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: AppButton(
                action: controller.logoutPressed,
                text: "logout_lbl",
                boarderRadius: 18,
                primary: false,
                btnColor: AppColor.red,
                txtColor: AppColor.red,
                fontSize: AppTextSizes.headerText1(),
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceXS(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: Divider(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.grey.withOpacity(0.5)
                    : AppColor.darkGrey.withOpacity(0.5),
                thickness: 1,
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceXL(),
            const AppSignatureWidget(),
            AppRatioSpaces.verticalSectionSpaceM(),
          ],
        ),
      ),
    );
  }

  Widget _imageSelectionWidget(BuildContext context) {
    return Container(
      child: _selectedImageWidget(context),
    );
  }

  Widget _selectedImageWidget(BuildContext context) {
    return Hero(
      tag: "profileImage_user",
      child: controller.user?.profileImageUrl == null
          ? AppLocalImage(
              imagePath: AppIcon.profileIcon,
              width: AppRatioSize.getRatioWidth() / 5.5,
              height: AppRatioSize.getRatioWidth() / 5.5,
              showBoarder: true,
            )
          : AppNetworkImage(
              width: AppRatioSize.getRatioWidth() / 5.5,
              height: AppRatioSize.getRatioWidth() / 5.5,
              showBoarder: true,
              imagePath: controller.user!.profileImageUrl!),
    );
  }
}
