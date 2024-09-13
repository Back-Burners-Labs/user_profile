import '../../../../../core/app_export.dart';
import '../../../../../core/reusableComponents/bottom_nav_item.dart';
import '../controllers/root_controller.dart';

class UserRootView extends GetView<RootController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        body: PopScope(
          canPop: controller.onWillPop(),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.primary),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Obx(() {
                  return Column(
                    children: [
                      Expanded(
                        child: controller.widgetOptions
                            .elementAt(controller.selectedIndex.value),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(() {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.blackShade.withOpacity(0.05)
                      : AppColor.white.withOpacity(0.05),
                  spreadRadius: 1.5,
                  blurRadius: 4,
                  offset: const Offset(0, -2), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                bottomNavItemX(context, iconPath: AppIcon.homeIcon),
                bottomNavItemX(context, iconPath: AppIcon.foodIcon),
                bottomNavItemX(context, iconPath: AppIcon.statIcon),
                bottomNavItemX(context, iconPath: AppIcon.profileIcon),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: AppColor.primary,
              unselectedItemColor: AppColor.grey,
              iconSize: 30,
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
              elevation: 0,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              enableFeedback: true,
            ),
          );
        }),
      ),
    );
  }
}
