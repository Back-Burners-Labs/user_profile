import '../../../../../../core/app_export.dart';
import '../../../../../../core/models/user.dart';
import '../../../../../auth/controllers/login_controller.dart';
import '../../../profile/bindings/profile_binding.dart';
import '../../../profile/views/profile_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showSearchButton;
  final bool? showCartButton;

  const HomeAppBar({super.key, this.showSearchButton, this.showCartButton});
  @override
  Widget build(BuildContext context) {
    final user = Get.find<LoginController>().user();
    return PreferredSize(
      preferredSize: Size(Get.width, 66),
      child: Container(
        margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 120),
        child: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          elevation: 0.0,
          primary: true,
          centerTitle: false,
          automaticallyImplyLeading: false,
          // actions: [],
          title: _customappBarTitle(context, user),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(Get.width, 66);
  }

  Widget _customappBarTitle(BuildContext context, User? user) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.to(() => const ProfileView(),
                binding: ProfileBinding(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 550));
          },
          child: Hero(
            tag: "profileImage_user",
            child: user?.profileImageUrl == null
                ? AppLocalImage(
                    imagePath: AppIcon.profileIcon,
                    width: AppRatioSize.getRatioWidth() / 10,
                    height: AppRatioSize.getRatioWidth() / 10,
                    showBoarder: true,
                  )
                : AppNetworkImage(
                    width: AppRatioSize.getRatioWidth() / 10,
                    height: AppRatioSize.getRatioWidth() / 10,
                    showBoarder: true,
                    imagePath: user!.profileImageUrl!),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: _appBarProfileName(context,
                "Hello ${user?.firstName ?? ''} ${user?.lastName ?? ''}"))
      ],
    );
  }

  Widget _appBarProfileName(BuildContext context, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context).copyWith(
            color: AppColor.lightBlueGrey,
          ),
        ),
        Text("welcome_to_app".tr,
            textAlign: TextAlign.left, style: TextStyleX.header3(context)),
      ],
    );
  }


  _appBarActionButton(BuildContext context,
      {required IconData iconData,
      required Function() action,
      required String heroTag}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: action,
          child: Hero(
            tag: heroTag,
            child: Container(
                width: AppRatioSize.getRatioWidth() / 10,
                height: AppRatioSize.getRatioWidth() / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary.withOpacity(0.1)
                      : AppColor.primary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  iconData,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.blackShade
                      : AppColor.creamColor,
                )),
          ),
        ),
      ],
    );
  }
}
