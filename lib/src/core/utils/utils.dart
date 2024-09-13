import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../app_export.dart';

class Utils {
  static Widget shadowGradientContainer() {
    return Container(
      width: Get.width,
      height: AppRatioSize.getRatioHeight() / 3.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.gradientPrimary.withOpacity(0.9),
            Colors.transparent,
          ],
          begin: const FractionalOffset(0.0, 1.0),
          end: const FractionalOffset(0.0, 0.0),
          stops: const [0.0, 0.6],
        ),
      ),
    ); // Return this widget
  }

  static void showBottomSheet(
    BuildContext context, {
    required final Widget child,
    required final VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: onClicked,
            child: const Text('Done'),
          ),
        ),
      );
  static DateTime stringToDateTime({required final String dateString}) {
    DateTime date = DateFormat("hh:mm:ss").parse(dateString);
    return date;
  }
}

