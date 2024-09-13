import '../app_export.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Color backgroundColor;
  final Color shadowColor;
  final Color inputColor;
  final bool showLabel;
  final String labelText;
  final double labelFontSize;
  final double boarderWeight;
  final Color? labelColor;
  final Color? prefixIconColor;
  final FontWeight fontWeight;
  final CrossAxisAlignment labelAlignment;
  final String hintText;
  final double hintFontSize;
  final Color hintColor;
  final FontWeight hintFontWeight;
  final bool showBoarder;
  final Color? boarderColor;
  final double boarderRadius;
  final double? boxWidth;
  final double? boxHeight;
  final double? shadowOpacity;
  final bool? obscureText;
  final bool showSuffixIcon;
  final IconData suffixIcon;
  final Function()? suffixAction;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final bool showPrefixIcon;
  final bool showErrorText;
  final int maxLine;
  final bool enabled;
  final IconData prefixIcon;
  final Function()? prefixAction;
  final Function(String)? onSubmit;
  final Widget? suffixWidget;

  const AppTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.backgroundColor = AppColor.white,
    this.shadowColor = AppColor.white,
    this.inputColor = AppColor.black,
    this.showLabel = true,
    this.labelText = "Label",
    this.labelFontSize = 14,
    this.labelColor = AppColor.primary,
    this.prefixIconColor,
    this.fontWeight = FontWeight.w800,
    this.labelAlignment = CrossAxisAlignment.start,
    this.hintText = "Hint",
    this.hintFontSize = 14,
    this.hintColor = AppColor.grey,
    this.boarderColor = AppColor.primary,
    this.hintFontWeight = FontWeight.w400,
    this.boarderRadius = 10,
    this.boxWidth,
    this.maxLine=1,
    this.boxHeight,
    this.obscureText,
    this.showSuffixIcon = false,
    this.suffixIcon = Icons.person,
    this.suffixAction,
    this.suffixIconPath,
    this.prefixIconPath,
    this.showPrefixIcon = false,
    this.enabled = true,
    this.showBoarder=false,
    this.prefixIcon = Icons.person,
    this.prefixAction,
    this.showErrorText = false,
    this.suffixWidget,
    this.shadowOpacity =0.1,
    this.onSubmit,
    this.boarderWeight=0.5


  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: labelAlignment,
      children: [
        showLabel == true
            ? Container(
                width: boxWidth,
                margin: const EdgeInsets.only(left: 4),
                child: Text(
                  labelText.tr,
                  style: TextStyleX.subHeading4(context).copyWith(
                        fontSize: labelFontSize,
                        fontWeight: fontWeight,
                        color: labelColor,
                      ),
                ),
              )
            : Container(),
        const SizedBox(
          height: 4,
        ),
        AppContainerWidget(
          disableDefaultVPadding: true,
          disableDefaultHPadding: true,
          shadowOpacity: shadowOpacity!,
          child: Material(
            color: backgroundColor,
            elevation: 0,
            borderRadius: BorderRadius.circular(boarderRadius),
            child: TextFormField(
              cursorColor: AppColor.primary,
              autofocus: false,
              maxLines: maxLine,
              style: TextStyleX.textFieldInput(context).copyWith(
                  color:Theme.of(context).brightness == Brightness.light
                      ? enabled?AppColor.blackShade:AppColor.grey
                      : enabled?AppColor.creamColor:AppColor.grey,
                  fontWeight: FontWeight.normal
              ),
              decoration: InputDecoration(
                  hintText: hintText.tr,
                  enabled: enabled,
                  contentPadding:  EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 32,
                      vertical: boxHeight ?? 12),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(boarderRadius)),
                      borderSide: BorderSide(color: labelColor!, width: boarderWeight*4>2?2:boarderWeight*4)),
                  enabledBorder: showBoarder?OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(boarderRadius)),
                      borderSide: BorderSide(color: boarderColor!, width: boarderWeight)):InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: showBoarder?OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(boarderRadius)),
                      borderSide: BorderSide(color: boarderColor!, width: boarderWeight)):InputBorder.none,
                  hintStyle: TextStyleX.textFieldHint(context).copyWith(
                        fontSize: hintFontSize,
                        fontWeight: hintFontWeight,
                        color: hintColor,
                      ),
                  suffixIcon: showSuffixIcon == true
                      ? suffixWidget!=null?Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          suffixWidget!,
                        ],
                      ):GestureDetector(
                          onTap: suffixAction,
                          child: suffixIconPath == null
                              ? Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppColor.primary.withOpacity(0.1)
                                          : AppColor.primary.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Icon(
                                    suffixIcon,
                                    color: obscureText == false
                                        ? labelColor
                                        : Theme.of(context).brightness ==
                                        Brightness.light
                                        ? hintColor.withOpacity(0.4)
                                        : AppColor.creamColor,
                                  ),
                                )
                              : Container(
                                  width: AppRatioSize.getRatioWidth() / 12,
                                  padding: EdgeInsets.all(
                                      AppRatioSize.getRatioWidth() / 32),
                                  child: Image.asset(
                                    suffixIconPath!,
                                    fit: BoxFit.contain,
                                    color: obscureText == true
                                        ? labelColor
                                        : hintColor,
                                  ),
                                ),
                        )
                      : null,
                  prefixIcon: showPrefixIcon == true
                      ? GestureDetector(
                          onTap: prefixAction,
                          child: prefixIconPath == null
                              ? Icon(
                                  prefixIcon,
                                  color: prefixIconColor??labelColor,
                                )
                              : Container(
                                  width: AppRatioSize.getRatioWidth() / 12,
                                  padding: EdgeInsets.all(
                                      AppRatioSize.getRatioWidth() / 32),
                                  child: Image.asset(
                                    prefixIconPath!,
                                    fit: BoxFit.contain,
                                    color: prefixIconColor??labelColor,
                                  ),
                                ),
                        )
                      : null),
              keyboardType: textInputType,
              controller: controller,
              obscureText: obscureText ?? false,
              onFieldSubmitted: (value){
                onSubmit!(value);
              },
            ),
          ),
        ),
        showErrorText
            ? Container(
                width: boxWidth,
                margin: const EdgeInsets.only(left: 4),
                child: Text(
                  "$labelText is required",
                  style: TextStyleX.subHeading1(context).copyWith(
                        fontSize: labelFontSize / 1.3,
                        fontWeight: FontWeight.w200,
                        color: AppColor.red,
                      ),
                ),
              )
            : Container(),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
