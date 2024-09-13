import '../../../../core/app_export.dart';

class AuthBottomOptionSection extends StatelessWidget {
  final Function() action;
  final String actionText;
  final String preText;

  const AuthBottomOptionSection(
      {super.key,
      required this.action,
      required this.actionText,
      required this.preText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            preText.tr,
            style: TextStyleX.subHeading3(context).copyWith(
              color: AppColor.lightBlueGrey,
            ),
          ),
          TextButton(
              onPressed: action,
              child: Text(
                actionText.tr,
                style: TextStyleX.subHeading1(context).copyWith(
                  color: AppColor.primary,
                ),
              ))
        ],
      ),
    );
  }
}
