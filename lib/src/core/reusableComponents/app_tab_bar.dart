import '../app_export.dart';

class AppTabBar extends StatefulWidget {
  final void Function(bool) onChange;
  final bool isFirstOptionSelected;
  final String optionOneText;
  final String optionTwoText;
  final double? horizontalMargin;
  final double? boxHeight;
  final double? boxWidth;
  final double? boarderRadius;

  const AppTabBar({
    super.key,
    required this.onChange,
    required this.optionOneText,
    required this.optionTwoText,
    this.horizontalMargin,
    required this.isFirstOptionSelected,
    this.boxHeight,
    this.boxWidth,
    this.boarderRadius
  });

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  bool optionOneSelected=true;


  @override
  void initState() {
    optionOneSelected=widget.isFirstOptionSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.boxHeight?? 44,
          width: widget.boxWidth??Get.width,
          margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin??Get.width/16),
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light ? AppColor.primary.withOpacity(0.15)
                  :AppColor.blackShade,
              borderRadius: BorderRadius.circular(widget.boarderRadius??12),
            border: Border.all(color: AppColor.primary,width: 2)
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      optionOneSelected=true;
                      widget.onChange(optionOneSelected);
                    });
                  },
                  child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      color: optionOneSelected?AppColor.primary:
                      Theme
                          .of(context)
                          .brightness == Brightness.light ? AppColor.white.withOpacity(0) :AppColor.blackShade,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(widget.boarderRadius!=null?widget.boarderRadius!-2:10))
                  ),
                  child:  Text(
                    widget.optionOneText.tr,
                    textAlign: TextAlign.center,
                    style: TextStyleX.subHeading2(context).copyWith(
                        color: optionOneSelected?
                        Theme
                            .of(context)
                            .brightness == Brightness.light ? AppColor.offWhite :AppColor.offWhite:
                        Theme
                            .of(context)
                            .brightness == Brightness.light ? AppColor.black :AppColor.offWhite,
                        fontSize: widget.boxWidth!=null?AppTextSizes.headerText4():AppTextSizes.headerText()
                    ),
                  ),
                ),
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      optionOneSelected=false;
                      widget.onChange(optionOneSelected);
                    });
                  },
                  child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                      color:  optionOneSelected==false?AppColor.primary:
                      Theme
                          .of(context)
                          .brightness == Brightness.light ? AppColor.white.withOpacity(0) :AppColor.blackShade,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(widget.boarderRadius!=null?widget.boarderRadius!-2:10))
                  ),
                  child:  Text(
                    widget.optionTwoText.tr,
                    textAlign: TextAlign.center,
                    style: TextStyleX.subHeading2(context).copyWith(
                        color:   optionOneSelected==false?Theme
                            .of(context)
                            .brightness == Brightness.light ? AppColor.offWhite :AppColor.offWhite:
                        Theme
                            .of(context)
                            .brightness == Brightness.light ? AppColor.black :AppColor.offWhite,
                        fontSize: widget.boxWidth!=null?AppTextSizes.headerText4():AppTextSizes.headerText()
                    ),
                  ),
                ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
