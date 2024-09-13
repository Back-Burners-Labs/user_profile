import 'dart:io';

import 'package:user_profile/src/modules/panels/global_widgets/overview_container_widget.dart';
import 'package:user_profile/src/modules/panels/global_widgets/radio_button_option.dart';

import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';

class NameInputView extends GetView<PreferenceController> {
  const NameInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AppFullSpaces.appVerticalSpacer1(),
            _imageSelectionWidget(context),
            AppRatioSpaces.verticalSectionSpaceM(),
            _firstNameField(context),
            AppRatioSpaces.verticalSectionSpaceS(),
            _lastNameField(context)
          ],
        ),
      ),
    );
  }

  Widget _imageSelectionWidget(BuildContext context) {
    return Column(
      children: [
        _profileImageWidget(context),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        Text(
          "add_profile_picture".tr,
          style: TextStyleX.subHeading3(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.lightBlueGrey
                : AppColor.lightBlueGrey,
          ),
        ),
      ],
    );
  }

  Widget _profileImageWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSourceSelectionPopUp(context);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _selectedImageWidget(context),
          _editProfileImageIconButton(context)
        ],
      ),
    );
  }

  Widget _selectedImageWidget(BuildContext context) {
    return Obx(() {
      return Container(
        height: AppRatioSize.getRatioWidth() / 4.5,
        width: AppRatioSize.getRatioWidth() / 4.5,
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
    });
  }

  Widget _editProfileImageIconButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.offWhite
                    : AppColor.blackShade,
                width: 2)),
        child: Image.asset(
          AppIcon.editIcon,
          color: AppColor.white,
          height: AppRatioSize.getRatioWidth() / 24,
        ));
  }

  Future _showSourceSelectionPopUp(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        builder: (context) {
          return OverviewContainerWidget(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text("select_media_type".tr,
                      style: TextStyleX.subHeading1(context)),
                ),
                RadioButtonOption(
                  controller.imageSourceOptionData,
                  onChanged: (value) {
                    controller.selectedImageSourceOption.value = value;
                  },
                  title: '',
                  showDescription: true,
                ),
                _popUpButtonSection(context),
                AppRatioSpaces.verticalSectionSpaceS()
              ],
            ),
          );
        });
  }

  Widget _popUpButtonSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: AppButton(
            action: () {
              Navigator.pop(context);
            },
            text: 'Cancel',
            txtColor: AppColor.primary,
            buttonHeight: AppRatioSize.getRatioHeight() / 18,
            primary: false,
          ),
        ),
        AppRatioSpaces.horizontalSectionSpaceXS(),
        Expanded(
          flex: 1,
          child: AppButton(
            action: () async {
              Navigator.pop(context);
              controller.selectImage();
            },
            text: "Continue",
            buttonHeight: AppRatioSize.getRatioHeight() / 18,
          ),
        ),
      ],
    );
  }

  Widget _firstNameField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        labelText: "lbl_first_name".tr,
        hintText: "hint_first_name".tr,
        controller: controller.firstNameTextController,
        showErrorText: controller.showFirstNameError.value,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _lastNameField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        labelText: "lbl_last_name".tr,
        hintText: "hint_last_name".tr,
        controller: controller.lastNameTextController,
        showErrorText: controller.showLastNameError.value,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }
}
