import '../../../../core/app_export.dart';
import '../../../../data/dataSource/local/user_type_data.dart';

class UserTypeCard extends StatelessWidget {
  final Function() action;
  final UserTypeModel userType;
  final bool isSelected;

  const UserTypeCard(
      {super.key,
      required this.action,
      required this.userType,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: AppRatioSize.getRatioHeight() / 5.5,
        width: Get.width / 2.4,
        margin: const EdgeInsets.only(
          bottom: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: AppRatioSize.getRatioHeight() / 5.5,
              width: Get.width / 2.4,
              margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 88),
              decoration: BoxDecoration(
                  color: isSelected
                      ? AppColor.primary.withOpacity(0.1)
                      : Theme.of(context).brightness == Brightness.light
                          ? AppColor.textBlueGrey.withOpacity(0.05)
                          : AppColor.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: isSelected
                          ? AppColor.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColor.textBlueGrey.withOpacity(0.1)
                              : AppColor.lightBlueGrey,
                      width: 2)),
            ),
            isSelected
                ? Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                        width: AppRatioSize.getRatioWidth() / 18,
                        height: AppRatioSize.getRatioWidth() / 18,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(Get.width),
                        ),
                        child: Icon(
                          Icons.check,
                          size: AppRatioSize.getRatioWidth() / 24,
                          color: AppColor.white,
                        )),
                  )
                : Container(),
            _userData(context)
          ],
        ),
      ),
    );
  }

  Widget _userData(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          userType.iconPath,
          width: AppRatioSize.getRatioWidth() / 8,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.textBlueGrey
              : AppColor.lightBlueGrey,
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        Text(
          userType.title.tr,
          style: TextStyleX.header2(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.textBlueGrey
                  : AppColor.lightBlueGrey,
              fontSize: AppTextSizes.titleText7()),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
