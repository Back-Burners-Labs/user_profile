import '../app_export.dart';

class AppKeyValueColumnWidget extends StatelessWidget{
  final String columnKey;
  final String value;
  final String? valueSuffix;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const AppKeyValueColumnWidget({super.key,
    required this.columnKey,
    required this.value,
    this.valueSuffix="ETH",
    this.crossAxisAlignment=CrossAxisAlignment.center,
    this.mainAxisAlignment= MainAxisAlignment.center
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:crossAxisAlignment!,
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        Text(
          columnKey.tr,
          style: TextStyleX.subHeading3(context).copyWith(
            color:
            AppColor.grey.withOpacity(0.8),
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppRatioSize.getRatioHeight() / 120,
        ),
        Flexible(
          child:Text(
            "$value $valueSuffix"
                .tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading3(context).copyWith(
              color:
              Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? AppColor.black:AppColor.white,
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }

}


class AppKeyValueRowWidget extends StatelessWidget{
  final String rowKey;
  final String value;
  final String? valueSuffix;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? keyWidth;
  final bool showDefaultHorizontalPadding;

  const AppKeyValueRowWidget({super.key,
    required this.rowKey,
    required this.value,
    this.valueSuffix="",
    this.crossAxisAlignment=CrossAxisAlignment.start,
    this.mainAxisAlignment= MainAxisAlignment.start,
    this.keyWidth,
    this.showDefaultHorizontalPadding=false
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: AppRatioSize.getRatioHeight() / 120,
          left: showDefaultHorizontalPadding==true?(AppRatioSize.getRatioWidth()/24):0,
          right: showDefaultHorizontalPadding==true?(AppRatioSize.getRatioWidth()/24):0
      ),
      child: Row(
        crossAxisAlignment:crossAxisAlignment!,
        mainAxisAlignment: mainAxisAlignment!,
        children: [
          SizedBox(
            width: keyWidth??AppRatioSize.getRatioWidth()/3,
            child: Text(
              "$rowKey:".tr,
              style: TextStyleX.subHeading3(context).copyWith(
                color:
                AppColor.grey.withOpacity(0.8),
              ),

              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: AppRatioSize.getRatioWidth() / 60,
          ),
          Expanded(
            child: Text(
              "$value $valueSuffix"
                  .tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading3(context).copyWith(
                color:
                Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? AppColor.black:AppColor.white,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

}