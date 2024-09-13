import 'package:user_profile/src/core/constants/app_fonts.dart';

import '../../../core/app_export.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget listChild;

  const ProfileItemWidget(
      {super.key, required this.title, required this.listChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AppContainerWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 44,
                  vertical: AppRatioSize.getRatioHeight() / 250),
              child: Text(
                title.tr,
                textAlign: TextAlign.start,
                style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.lightBlueGrey,
                  fontFamily: AppFonts.titles
                ),
              ),
            ),
            listChild,
          ],
        ),
      ),
    );
  }
}
