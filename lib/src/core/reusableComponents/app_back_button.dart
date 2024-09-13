import '../app_export.dart';

class AppBackButton extends StatelessWidget {
  final Function()? action;

  const AppBackButton({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: action ??
            () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              Get.back(closeOverlays: true);
            },
        child: Container(
            padding: EdgeInsets.only(left: AppRatioSize.getRatioWidth() / 44),
            width: AppRatioSize.getRatioWidth() / 8,
            height: AppRatioSize.getRatioWidth() / 8,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade
                  : AppColor.creamColor,
            )),
      ),
    );
  }
}
