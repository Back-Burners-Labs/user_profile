import '../app_export.dart';

class AppSectionTitle extends StatefulWidget{
  final String title;
  final String? subTitle;
  final String? secondaryOptionText;
  final bool? showViewAll;
  final double? fontSize;
  final bool? showFilterMenu;
  final bool? disableDefaultHPadding;
  final bool? disableDefaultVPadding;
  final Color? titleColor;
  final Function()? onTapViewAll;

  const AppSectionTitle({super.key,
    required this.title,
    this.subTitle,
    this.secondaryOptionText,
    this.showViewAll=false,
    this.showFilterMenu,
    this.fontSize,
    this.disableDefaultHPadding=false,
    this.disableDefaultVPadding=false,
    this.titleColor,
    this.onTapViewAll
  });

  @override
  State<AppSectionTitle> createState() => _AppSectionTitleState();
}

class _AppSectionTitleState extends State<AppSectionTitle> {

  late Offset initialOffset;


  @override
  void initState() {
    initialOffset=Offset.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.disableDefaultHPadding==true?0:AppRatioSize.getRatioWidth() / 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Row(
                  children: [
                    Text(
                      widget.title.tr,
                      textAlign: TextAlign.start,
                      style: TextStyleX.header3(context).copyWith(
                        color: widget.titleColor ?? (Theme
                          .of(context)
                          .brightness == Brightness.light
                          ? AppColor.textBlueGrey
                          : AppColor.creamColor),
                        fontSize: widget.fontSize?? AppTextSizes.titleText8(),),
              ),
                    widget.subTitle!=null?Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${widget.subTitle}".tr,
                          textAlign: TextAlign.left,
                          style: TextStyleX.subHeading1(context).copyWith(
                              color: AppColor.primary,
                              fontSize: AppTextSizes.titleText5()
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ):Container()
                  ],
                ),
              widget.showViewAll==true?
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  final tapPosition = details.globalPosition;
                  final x = tapPosition.dx;
                  final y = tapPosition.dy;
                  initialOffset = Offset(x, y);
                },
                onTap: widget.showFilterMenu==true?() async {
                  await showMenu(
                    context: context,
                    color: AppColor.blackBlue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    position: RelativeRect.fromLTRB(
                        initialOffset.dx, initialOffset.dy, initialOffset.dx, initialOffset.dy),
                    items: [
                      PopupMenuItem(
                        value: 1,
                        onTap: (){
                          SnackBarX.showSuccess(title: widget.title.tr,
                              message: "${"filter_applied_snack_message".tr} 1");

                        },
                        child: Text(
                          "filter_lbl".tr+" 1".tr,
                          style: TextStyleX.subHeading2BlueGrey(context),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        onTap: (){
                          SnackBarX.showSuccess(title: widget.title.tr,
                              message: "${"filter_applied_snack_message".tr} 2");
                        },
                        child: Text(
                          "filter_lbl".tr+" 2".tr,
                          style: TextStyleX.subHeading2BlueGrey(context),
                        ),
                      ),
                    ],
                    elevation: 8.0,
                  ).then((value) {

                  });
                }:(){
                  if(widget.onTapViewAll!=null){
                    widget.onTapViewAll!();
                  }
                },
                child: Text(
                  (widget.secondaryOptionText??"see_all").tr,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).brightness==Brightness.light?AppColor.primary:AppColor.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: widget.fontSize==null?AppTextSizes.headerText2():AppTextSizes.headerText3(),
                  ),
                ),
              )
                  :
              Container(),
            ],
          ),
          SizedBox(
            height: widget.disableDefaultVPadding==true?0:AppRatioSize.getRatioHeight() / 88,
          ),
        ],
      ),
    );
  }
}

