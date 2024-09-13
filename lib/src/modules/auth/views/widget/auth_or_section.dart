import '../../../../core/app_export.dart';

class AuthOrSection extends StatelessWidget {
  const AuthOrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: AppRatioSize.getRatioHeight() / 44),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: AppColor.grey,
          ),
          Container(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.offWhite
                : AppColor.blackShade,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "or_text".tr,
              style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.grey, fontSize: AppTextSizes.headerText2()),
            ),
          ),
        ],
      ),
    );
  }
}
