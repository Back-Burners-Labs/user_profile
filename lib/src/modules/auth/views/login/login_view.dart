import 'dart:io';
import '../../../../core/app_export.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_bottom_option_section.dart';
import '../widget/auth_option_widget.dart';
import '../widget/auth_or_section.dart';
import '../widget/auth_title_section.dart';
import '../widget/user_type_selection_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});


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
            .brightness == Brightness.light ? AppColor.offWhite : AppColor
            .blackShade,
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Column(
                  children: [
                    AppRatioSpaces.verticalSectionSpaceXL(),
                    const AuthTitleSection(
                      titleText: "login_title",
                      subtitleText: "login_sub_title",
                    ),
                    AppRatioSpaces.verticalSectionSpaceXS(),
                    // const UserTypeSelectionView(),
                    AppRatioSpaces.verticalSectionSpaceMF(),
                    _emailField(context),
                    AppRatioSpaces.verticalSectionSpaceS(),
                    _passwordField(context),
                    AppRatioSpaces.verticalSectionSpaceXS(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: controller.forgotPasswordClick,
                          child: Text(
                            "forget_password".tr,
                            style: TextStyleX.subHeading2(context).copyWith(
                                color: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppRatioSpaces.verticalSectionSpaceM(),
                    Hero(
                      tag: "auth_button",
                      child: AppButton(
                        action: controller.loginClick,
                        text: "login_text",
                        fontSize: AppTextSizes.headerText(),
                        buttonWidth: double.infinity,
                        boarderRadius: 8,
                      ),
                    ),
                    const AuthOrSection(),
                    AuthOptionWidget(
                        action: () => controller.onProviderClick('Google'),
                        text: "continue_with_google",
                        iconPath: AppIcon.googleIcon),
                    !Platform.isIOS
                        ? SizedBox(height: AppRatioSize.getRatioHeight() / 66)
                        : Container(),
                    !Platform.isIOS ? AuthOptionWidget(
                      action: () => controller.onProviderClick('Apple'),
                      text: "continue_with_apple",
                      iconPath: AppIcon.appleIcon,
                      iconColor: Theme
                          .of(context)
                          .brightness == Brightness.light
                          ? AppColor.blackShade
                          : AppColor.creamColor,
                    ) : Container(),
                    AppRatioSpaces.verticalSectionSpaceMF(),
                    AuthBottomOptionSection(
                        action: controller.signUpClick,
                        actionText: "sign_up_text",
                        preText: "dont_have_account"),
                  ],
                ),
              ),
            ),
          ),
        ),
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
        suffixIcon: controller.passwordObscure.value ? Icons
            .visibility_off_rounded : Icons.visibility_rounded,
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

  Widget _emailField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        labelText: "email_text".tr,
        hintText: "email_hint_text".tr,
        controller: controller.emailTextController.value,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }
}