import '../../../../core/app_export.dart';

class AuthOptionWidget extends StatelessWidget {
  final Function() action;
  final String text;
  final String iconPath;
  final Color? iconColor;

  const AuthOptionWidget(
      {super.key,
      required this.action,
      required this.text,
      required this.iconPath,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: AppRatioSize.getRatioHeight() / 88),
        decoration: BoxDecoration(
          color: AppColor.lightBlueGrey.withOpacity(0.08),
          border: Border.all(
              color: AppColor.textBlueGrey.withOpacity(0.1), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 24,
              width: 24,
              color: iconColor,
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            SizedBox(
              width: AppRatioSize.getRatioWidth() / 44,
            ),
            Text(text.tr, style: TextStyleX.subHeading1(context)),
          ],
        ),
      ),
    );
  }
}
