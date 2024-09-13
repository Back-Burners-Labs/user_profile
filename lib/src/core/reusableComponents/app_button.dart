import '../app_export.dart';
import '../constants/app_fonts.dart';

class AppButton extends StatelessWidget {
  final void Function() action;
  final String text;
  final Color btnColor;
  final Color txtColor;
  final bool? enabled;
  final bool? primary;
  final String? fontFamily;
  final double? fontSize;
  final bool? isLoading;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? boarderRadius;

  const AppButton({
    super.key,
    required this.action,
    required this.text,
    this.btnColor = AppColor.primary,
    this.txtColor = AppColor.white,
    this.enabled = true,
    this.primary = true,
    this.fontFamily = AppFonts.buttons,
    this.fontSize,
    this.isLoading,
    this.buttonWidth,
    this.buttonHeight,
    this.boarderRadius = 4
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: enabled==true ? action : null,
        child: Container(
          height: buttonHeight??48,
          width: isLoading==true ? buttonHeight??52:buttonWidth??Get.width,
          decoration: primary==true?BoxDecoration(
            color: enabled==true ? btnColor : AppColor.grey.withOpacity(0.4),
            borderRadius:  BorderRadius.all(Radius.circular(boarderRadius??Get.width)),
          ): BoxDecoration(
            border: Border.all(color: btnColor),
            borderRadius: BorderRadius.circular(boarderRadius??Get.width),
          ),
          child: Center(
              child: isLoading==true?
              const CircularProgressIndicator(
                color: AppColor.white,
              ):
              Text(
                text.tr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.buttonText(context).copyWith(
                color: txtColor,
                fontFamily: fontFamily,
                fontSize: fontSize??AppTextSizes.buttonText1(),
              )
              )
          ),
        ));
  }
}
