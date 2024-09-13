import 'package:user_profile/src/core/app_export.dart';

class ProfileOptionModel {
  int? id;
  String? iconPath;
  String? name;
  String? desc;
  void Function()? action;
  Widget? iconRight;
  String? notificationCount;

  ProfileOptionModel({
    this.id,
    this.iconPath,
    this.name,
    this.desc,
    this.action,
    this.iconRight,
    this.notificationCount,
  });
}
