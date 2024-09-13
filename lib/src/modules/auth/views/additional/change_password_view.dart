import '../../../../core/app_export.dart';
import '../../../panels/global_widgets/app_bar_widget.dart';
import '../../controllers/login_controller.dart';

class ChangePasswordView extends GetView<LoginController> {
  const ChangePasswordView({super.key});


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
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        appBar: sessionAppBar(context, showSaveIcon: false, title: "change_password",),
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Column(
                  children: [
                    AppRatioSpaces.titleToNext(),
                    _oldPasswordField(context),
                    AppRatioSpaces.verticalSectionSpaceXS(),
                    _newPasswordField(context),
                    AppRatioSpaces.verticalSectionSpaceXS(),
                    _newConfirmPasswordField(context),
                    AppRatioSpaces.verticalSectionSpaceXXL(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _bottomNavBarButton(),
      ),
    );
  }


  Widget _oldPasswordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.oldPasswordTextController,
        hintText: "old_pass_hint".tr,
        labelText: "old_pass_label".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.passwordObscure.value,
        suffixIcon: controller.passwordObscure.value?Icons.visibility_off_rounded:Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeObscure,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _newPasswordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.newPasswordTextController,
        hintText: "new_pass_hint".tr,
        labelText: "new_pass_label".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.confirmPasswordObscure.value,
        suffixIcon: controller.confirmPasswordObscure.value?Icons.visibility_off_rounded:Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeConfirmPasswordObscure,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _newConfirmPasswordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.newConfirmPasswordTextController,
        hintText: "new_pass_confirm_hint".tr,
        labelText: "new_pass_confirm_label".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.confirmPasswordObscure.value,
        suffixIcon: controller.confirmPasswordObscure.value?Icons.visibility_off_rounded:Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeConfirmPasswordObscure,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  _bottomNavBarButton(){
    return Container(
      margin: AppPaddings.bottomBarButton(),
      child: Hero(
        tag: "auth_button",
        child: AppButton(
          action: controller.onClickAuthChangePassword,
          text: "lbl_btn_change",
          fontSize: AppTextSizes.headerText(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
        ),
      ),
    );
  }
}