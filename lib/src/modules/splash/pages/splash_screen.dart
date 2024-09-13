import '../../../core/app_export.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.primary // AppColor.white
                    : AppColor.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*Container(
                      padding: AppPaddings.splashLogo(),
                      child: const Divider(
                        color: AppColor.primary,
                        thickness: 2.5,
                      )),*/
                  AppRatioSpaces.verticalSectionSpaceM(),
                  Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? AppImage.logoAndTextDark // AppImage.logoAndTextDark
                        : AppImage.logoAndTextDark,
                    scale: 2.5,
                    fit: BoxFit.cover,
                  ),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  /*
                  Container(
                      padding: AppPaddings.splashLogo(),
                      child: const Divider(
                        color: AppColor.primary,
                        thickness: 2.5,
                      )),
                   */
                ],
              ),
            )));
  }
}
