import 'package:user_profile/src/core/app_export.dart';
import 'package:user_profile/src/data/dataSource/local/preference_data.dart';

class OptionContainerWidget extends StatelessWidget {
  final PreferenceGeneralModel item;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool hideDescription;
  final bool hideIconImage;
  final bool hideCheckbox;

  const OptionContainerWidget({
    super.key,
    required this.item,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.hideDescription = false,
    this.hideIconImage = true,
    this.hideCheckbox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hideCheckbox
          ? EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24,
              vertical: AppRatioSize.getRatioHeight() / 42)
          : EdgeInsets.only(
              left: AppRatioSize.getRatioWidth() / 24,
              right: AppRatioSize.getRatioWidth() / 100),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.isSelected == true
              ? AppColor.primary
              : Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
          width: 2,
        ),
        boxShadow: item.isSelected == true
            ? [
                BoxShadow(
                  color: AppColor.primary.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          hideIconImage
              ? Container()
              : Image.asset(
                  item.imagePath ?? "",
                  width: AppRatioSize.getRatioWidth() / 8,
                ),
          hideIconImage
              ? Container()
              : AppRatioSpaces.verticalSectionSpaceXXXS(),
          hideCheckbox
              ? Text(
                  "${item.title}".tr,
                  style: TextStyleX.header5(context)
                      .copyWith(fontSize: AppTextSizes.headerText1()),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${item.title}".tr,
                        style: TextStyleX.subHeading1(context)),
                    SizedBox(
                      height: AppRatioSize.getRatioHeight() / 18,
                      width: AppRatioSize.getRatioWidth() / 10,
                      child: item.isSelected == true
                          ? const Icon(
                              Icons.check_box_rounded,
                              color: AppColor.primary,
                            )
                          : const Icon(
                              Icons.check_box_outline_blank,
                              color: AppColor.grey,
                            ),
                    )
                  ],
                ),
          hideDescription
              ? Container()
              : AppRatioSpaces.verticalSectionSpaceXXXS(),
          hideDescription
              ? Container()
              : Text(
                  "${item.desc}".tr,
                  textAlign: crossAxisAlignment == CrossAxisAlignment.center
                      ? TextAlign.center
                      : TextAlign.start,
                  style: TextStyleX.subHeading2(context)
                      .copyWith(fontSize: AppTextSizes.headerText4()),
                ),
        ],
      ),
    );
  }
}
