import 'dart:io';
import '../../../../core/app_export.dart';
import '../../controllers/registration_controller.dart';
import '../widget/auth_bottom_option_section.dart';
import '../widget/auth_option_widget.dart';
import '../widget/auth_or_section.dart';
import '../widget/auth_title_section.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

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
        appBar: appBarEmpty(),
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
                      titleText: "sign_up_title",
                      subtitleText: "sign_up_sub_title",
                    ),
                    _formSection(context),
                    const AuthOrSection(),
                    AuthOptionWidget(
                        action: () => controller.onProviderClick('Google'),
                        text: "continue_with_google",
                        iconPath: AppIcon.googleIcon),
                    !Platform.isIOS
                        ? SizedBox(height: AppRatioSize.getRatioHeight() / 66)
                        : Container(),
                    !Platform.isIOS
                        ? AuthOptionWidget(
                            action: () => controller.onProviderClick('Apple'),
                            text: "continue_with_apple",
                            iconPath: AppIcon.appleIcon,
                            iconColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.blackShade
                                    : AppColor.creamColor,
                          )
                        : Container(),
                    AppRatioSpaces.verticalSectionSpaceM(),
                    AuthBottomOptionSection(
                      preText: "already_have_account",
                      actionText: "login_text",
                      action: controller.onLoginClick,
                    ),
                    AppRatioSpaces.verticalSectionSpaceL(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formSection(BuildContext context) {
    return Column(
      children: [
        _emailField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _passwordField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _confirmPasswordField(context),
        AppRatioSpaces.verticalSectionSpaceM(),
        Hero(
          tag: "auth_button",
          child: AppButton(
            action: controller.onSignUpClick,
            text: "sign_up_text",
            fontSize: AppTextSizes.headerText(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
          ),
        ),
      ],
    );
  }

  Widget _passwordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.passwordTextController,
        hintText: "password_hint_text".tr,
        labelText: "password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.passwordObscure.value,
        suffixIcon: controller.passwordObscure.value
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changePasswordObscure,
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

  Widget _emailField(BuildContext context) {
    return AppTextField(
      labelText: "email_text".tr,
      hintText: "email_hint_text".tr,
      controller: controller.emailTextController,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }
}
