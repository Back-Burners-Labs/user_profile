import 'dart:io';
import '../app_export.dart';

class SnackBarX{
  static showError({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
        Get.snackbar(title.tr, message.tr,
        duration: const Duration(milliseconds: 1800),
        backgroundColor: backgroundColor??AppColor.red.withOpacity(0.8),
        colorText: textColor??AppColor.white,
        icon: const Icon(Icons.error,color: AppColor.white,),
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM);


  }
  static showErrorCenter({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        duration: const Duration(milliseconds: 2200),
        backgroundColor: backgroundColor?? AppColor.red.withOpacity(0.8),
        colorText:textColor?? AppColor.white,
        icon: const Icon(Icons.error,color: AppColor.white,),
        margin:  EdgeInsets.only(left: 8,right: 8,bottom: Get.height/2.2),
        dismissDirection: DismissDirection.horizontal,
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM);

  }

  static showWarning({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? AppColor.lightBlueGrey.withOpacity(0.7),
        colorText:textColor?? AppColor.white,
        icon: const Icon(Icons.warning_rounded,color: AppColor.white,),
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1200));
  }
  static showSuccess({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? AppColor.primary.withOpacity(0.7),
        colorText:textColor?? AppColor.white,
        icon: const Icon(Icons.check,color: AppColor.gradientPrimary,),
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1200)
    );
  }
  static showMessage({required String title,required String message,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        colorText:textColor?? AppColor.black,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
    );
  }
  static showActionMessage({required String title,required String message,required Function() action,Color? backgroundColor,Color? textColor}){
    Get.closeCurrentSnackbar();
    Get.snackbar(title.tr, message.tr,
        backgroundColor:backgroundColor?? AppColor.black.withOpacity(0.8),
        colorText:textColor?? AppColor.white,
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        snackPosition: Platform.isIOS?SnackPosition.TOP:SnackPosition.BOTTOM,
        mainButton: TextButton(
            onPressed:action,
            child: const Text(
          "UNDO",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.amber,
          ),
        )),
        duration: const Duration(milliseconds: 4500)
    );
  }
}