import '../../../../core/app_export.dart';

class AuthTitleSection extends StatelessWidget {
  final String titleText;
  final String subtitleText;

  const AuthTitleSection(
      {super.key, required this.titleText, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "auth_title",
          child: Text(titleText.tr, style: TextStyleX.header2(context)),
        ),
        AppRatioSpaces.verticalSectionSpaceXS(),
        Hero(
          tag: "auth_sub_title",
          child: Text(
            subtitleText.tr,
            textAlign: TextAlign.center,
            style: TextStyleX.subHeading2(context),
            maxLines: 3,
          ),
        ),
        AppRatioSpaces.verticalSectionSpaceM(),
      ],
    );
  }
}
