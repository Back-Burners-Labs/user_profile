import 'dart:io';
import '../../../../../core/app_export.dart';
import '../../../../../modules/panels/global_widgets/overview_container_widget.dart';
import '../../../../../modules/panels/global_widgets/radio_button_option.dart';
import '../../../../../modules/panels/user/profile/views/widgets/edit_preference_bottomsheet.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        appBar: sessionAppBar(
          context, showSaveIcon: false, title: "edit_profile_title",
          // backButtonAction: _preferenceController.backClick
        ),
        body: Container(
            height: Get.height,
            width: Get.width,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                AppRatioSpaces.verticalSectionSpaceM(),
                _basicProfilePreferenceForm(context),
                AppRatioSpaces.verticalSectionSpaceXXS(),
               //  _preferenceInfoWidget(context),
                AppRatioSpaces.verticalSectionSpaceM(),
              ],
            )
            // PreferenceView(isEditMode: true,)
            ),
        bottomNavigationBar: _bottomNavBarButtons(context),
      ),
    );
  }

  _bottomNavBarButtons(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1)
                  : AppColor.white.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarPurchaseButtons(context));
  }

  Widget _bottomNavBarPurchaseButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: controller.saveProfileChanges,
            text: "save_changes_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }

  Widget _basicProfilePreferenceForm(BuildContext context) {
    return Obx(() {
      return Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
        child: Column(
          children: [
            _imageSelectionWidget(context),
            AppRatioSpaces.verticalSectionSpaceM(),
            _textEditField(context,
                label: "lbl_first_name",
                hint: "hint_first_name",
                textEditingController: controller.firstNameTextController,
                showError: controller.showFirstNameError.value,
                showSuffix: false,
                suffixWidget: Container()),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _textEditField(context,
                label: "lbl_last_name",
                hint: "hint_last_name",
                textEditingController: controller.lastNameTextController,
                showError: controller.showLastNameError.value,
                showSuffix: false,
                suffixWidget: Container()),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _textEditField(context,
                label: "age_lbl",
                hint: "age_hint",
                textEditingController: controller.ageTextController,
                showError: controller.showAgeError.value,
                showSuffix: false,
                suffixWidget: Container()),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _textEditField(context,
                label: "weight_lbl",
                hint: "weight_hint",
                textEditingController: controller.weightTextController,
                showError: controller.showWeightError.value,
                showSuffix: true,
                suffixWidget: AppTabBar(
                    horizontalMargin: 8,
                    boarderRadius: 8,
                    boxWidth: 70,
                    boxHeight: 35,
                    isFirstOptionSelected: true,
                    onChange: (value) {},
                    optionOneText: "Kg",
                    optionTwoText: "Lbs")),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _textEditField(context,
                label: "height_lbl",
                hint: "height_hint",
                textEditingController: controller.heightTextController,
                showError: controller.showHeightError.value,
                showSuffix: true,
                suffixWidget: AppTabBar(
                    horizontalMargin: 8,
                    boarderRadius: 8,
                    boxWidth: 70,
                    boxHeight: 35,
                    isFirstOptionSelected: false,
                    onChange: (value) {},
                    optionOneText: "Cm",
                    optionTwoText: "Ft")),
          ],
        ),
      );
    });
  }

  Widget _preferenceInfoWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "lbl_preferences".tr,
                style: TextStyleX.subHeading1(context)
                    .copyWith(fontSize: AppTextSizes.headerText1()),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return EditPreferenceBottomSheet();
                    },
                  );
                },
                child: SizedBox(
                    width: AppRatioSize.getRatioWidth() / 20,
                    height: AppRatioSize.getRatioWidth() / 20,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(AppIcon.editIcon))),
              )
            ],
          ),
        ),
        Obx(() {
          return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24, vertical: 8),
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedPreferenceList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppRatioSize.getRatioWidth() / 44,
                          vertical: AppRatioSize.getRatioHeight() / 120),
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.textFieldBackground
                                  : AppColor.blackShade,
                          border: Border.all(
                              color: AppColor.boarderBlueGrey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.selectedPreferenceList[index].title}"
                                .tr,
                            style: TextStyleX.subHeading1(context),
                          ),
                          "${controller.selectedPreferenceList[index].desc}"
                                      .tr ==
                                  ""
                              ? Container()
                              : AppRatioSpaces.verticalSectionSpaceXXXS(),
                          "${controller.selectedPreferenceList[index].desc}"
                                      .tr ==
                                  ""
                              ? Container()
                              : Text(
                                  "${controller.selectedPreferenceList[index].desc}"
                                      .tr,
                                  style: TextStyleX.subHeading1(context)
                                      .copyWith(
                                          color: AppColor.grey,
                                          fontSize: AppTextSizes.headerText4()),
                                ),
                        ],
                      ),
                    );
                  }));
        }),
      ],
    );
  }



  Widget _imageSelectionWidget(BuildContext context) {
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
      return Hero(
        tag: "profileImage_user",
        child: Container(
          height: AppRatioSize.getRatioWidth() / 5.5,
          width: AppRatioSize.getRatioWidth() / 5.5,
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
        ),
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
                    ? AppColor.white
                    : AppColor.black,
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
                  child: Text(
                    "select_media_type".tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.textBlueGrey
                            : AppColor.creamColor,
                        fontSize: AppTextSizes.headerText1()),
                  ),
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
            text: 'cancel_lbl',
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
            text: "lbl_btn_continue",
            buttonHeight: AppRatioSize.getRatioHeight() / 18,
          ),
        ),
      ],
    );
  }

  Widget _textEditField(BuildContext context,
      {required String label,
      required String hint,
      required TextEditingController textEditingController,
      required bool showError,
      required bool showSuffix,
      Widget? suffixWidget}) {
    return AppTextField(
      labelText: label.tr,
      hintText: hint.tr,
      controller: textEditingController,
      showErrorText: showError,
      showBoarder: true,
      boarderColor: AppColor.boarderBlueGrey,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showSuffixIcon: showSuffix,
      suffixWidget: suffixWidget,
    );
  }
}
