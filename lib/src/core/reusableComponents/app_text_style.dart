import 'package:google_fonts/google_fonts.dart';
import '../app_export.dart';

class TextStyleX {
  static TextStyle titleText1(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.white,
      height: 1.3,
      fontSize: AppTextSizes.titleText1(),
    );
  }

  static TextStyle titleText3(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
      fontSize: AppTextSizes.titleText3(),
    );
  }

  static TextStyle titleText5(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText5(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle titleText7(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText7(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header1(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText4(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header2(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText4(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header3(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText8(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header4(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText8(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header5(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText1(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle header6(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText(),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle subHeading1(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText1(),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle subHeading2(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText3(),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.lightBlueGrey
          : AppColor.grey,
    );
  }

  static TextStyle subHeading2BlueGrey(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText3(),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle subHeading3(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText2(),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle subHeading4(BuildContext context) {
    return GoogleFonts.poppins(
        decoration: TextDecoration.none,
        fontSize: AppTextSizes.titleText8(),
        fontWeight: FontWeight.w500,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.textBlueGrey
            : AppColor.creamColor,
        letterSpacing: 0.5);
  }

  static TextStyle subHeading5(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText8(),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle subHeading6(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText4(),
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.white,
    );
  }

  static TextStyle body1(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.bodyText2(),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.lightBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle body2(BuildContext context) {
    return GoogleFonts.poppins(
        decoration: TextDecoration.none,
        fontSize: AppTextSizes.headerText4(),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.textBlueGrey
            : AppColor.creamColor,
        letterSpacing: 1);
  }

  static TextStyle body3(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.bodyText2(),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle body4Medium(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.headerText6(),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle body5(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: AppTextSizes.titleText8(),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle textFieldHint(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: 14,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.grey
          : AppColor.grey,
    );
  }

  static TextStyle textFieldInput(BuildContext context) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey
          : AppColor.creamColor,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return GoogleFonts.poppins(
        decoration: TextDecoration.none,
        fontSize: AppTextSizes.buttonText1(),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.textBlueGrey
            : AppColor.creamColor,
        fontWeight: FontWeight.w600);
  }

  static TextStyle customTextStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
