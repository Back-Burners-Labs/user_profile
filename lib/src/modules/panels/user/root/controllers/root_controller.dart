import '../../../../../core/app_export.dart';
import '../../../../../modules/panels/user/home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool profileIsConnected = false.obs;
  DateTime cTime = DateTime.now();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const ProfileView(),
  ];

  bool onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(cTime) > const Duration(seconds: 2)) {
      cTime = now;

      return false;
    }

    return true;
  }
}
