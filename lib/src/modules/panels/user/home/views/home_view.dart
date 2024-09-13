import '../../../../../core/app_export.dart';
import '../controllers/home_controller.dart';
import 'widget/home_app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
          top: false,
          child: Scaffold(
              appBar: const HomeAppBar(),
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              body: Container(
                height: Get.height,
                width: Get.width,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    Text("Bonjour tout le monde !!!")
                  ],
                ),
              )),
        ),
    );
  }
}
