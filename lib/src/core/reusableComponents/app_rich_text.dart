import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class AppRichText extends StatelessWidget {
  final String? prefixText;
  final String? boldText;
  final String? suffixText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final int? maxLine;
  final TextAlign? textAlign;

  const AppRichText({super.key,
    this.prefixText,
    this.boldText,
    this.suffixText,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.maxLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.montserrat(
          decoration: TextDecoration.none,
          fontSize: fontSize??16,
          color: fontColor??AppColor.black,
          fontWeight: fontWeight??FontWeight.w500,
          letterSpacing: -0.25,
        ),
        children: <TextSpan>[
          TextSpan(text: '$prefixText'),
          TextSpan(text: '$boldText', style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: '$suffixText'),
        ],
      ),
    );
  }
}

