import '../../../core/app_export.dart';

class AppSignatureWidget extends StatelessWidget {
  const AppSignatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "app_name".tr,
            textAlign: TextAlign.start,
            style: TextStyleX.subHeading2(context),
          ),
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        Text(
          "Version 1.0.0",
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading2BlueGrey(context),
        ),
      ],
    );
  }
}
