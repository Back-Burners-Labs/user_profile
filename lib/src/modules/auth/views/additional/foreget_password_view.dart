import '../../../../core/app_export.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_title_section.dart';

class ForgotPasswordView extends GetView<LoginController> {
  const ForgotPasswordView({super.key});


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
                      titleText: "forget_password_title",
                      subtitleText: "forget_password_subtitle"
                    ),
                    AppRatioSpaces.titleToNext(),
                    _emailField(context),
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


  Widget _emailField(BuildContext context) {
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
  }
  _bottomNavBarButton(){
    return Container(
      margin: AppPaddings.bottomBarButton(),
      child: Hero(
        tag: "auth_button",
        child: AppButton(
          action: controller.sendCodeClick,
          text: "lbl_btn_send_code",
          fontSize: AppTextSizes.headerText(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
        ),
      ),
    );
  }
}