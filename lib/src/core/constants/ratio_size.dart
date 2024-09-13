import 'dart:io';
import 'package:get/get.dart';

class AppRatioSize{

  static double getRatioWidth(){
   double width = Get.width;
    if(Platform.isAndroid){
      return width>415?415:width;
    }else if(Platform.isIOS){
      return width>430?430:width;
    }
    else{
      return width;
    }

  }

  static double getRatioHeight(){
    double height = Get.height;
    if(Platform.isAndroid){
      return height>821?821:height;
    }else if(Platform.isIOS){
      return height>930?930:height;
    }
    else{
      return height;
    }
  }
}