import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_export.dart';

class AppHtmlView{
  static Html applyHtml(BuildContext context,{required String text,required TextStyle style, required TextAlign textAlign, Alignment alignment = Alignment.centerLeft}) {
    return Html(
      data: text.replaceAll('\r\n', ''),
        style: {
          "*": Style(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Theme
                .of(context)
                .brightness ==
                Brightness.light
                ? AppColor.textBlueGrey
                : AppColor.creamColor,
          ),
        }
    );
  }
}