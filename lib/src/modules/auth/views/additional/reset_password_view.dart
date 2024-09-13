import '../../../../core/app_export.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_title_section.dart';

class ResetPasswordView extends GetView<LoginController> {
  const ResetPasswordView({super.key});

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
            ? AppColor.offWhite
            : AppColor.blackShade,
        appBar: appBarWithBackButton(),
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Column(
                  children: [
                    AppRatioSpaces.appbarToTitle(),
                    const AuthTitleSection(
                      titleText: "create_new_pass_title",
                      subtitleText: "create_new_pass_subtitle",
                    ),
                    AppRatioSpaces.titleToNext(),
                    _passwordField(context),
                    AppRatioSpaces.verticalSectionSpaceXS(),
                    _confirmPasswordField(context),
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

  Widget _passwordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.passwordTextController.value,
        hintText: "password_hint_text".tr,
        labelText: "password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.passwordObscure.value,
        suffixIcon: controller.passwordObscure.value
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeObscure,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _confirmPasswordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.confirmPasswordTextController,
        hintText: "confirm_password_hint_text".tr,
        labelText: "confirm_password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.confirmPasswordObscure.value,
        suffixIcon: controller.confirmPasswordObscure.value
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeConfirmPasswordObscure,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  _bottomNavBarButton() {
    return Container(
      margin: AppPaddings.bottomBarButton(),
      child: Hero(
        tag: "auth_button",
        child: AppButton(
          action: controller.onClickChangePassword,
          text: "lbl_btn_change",
          fontSize: AppTextSizes.headerText(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
        ),
      ),
    );
  }
}
