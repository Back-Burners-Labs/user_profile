import '../../../core/app_export.dart';

class UserTypeModel {
  int id;
  String title;
  String desc;
  String iconPath;
  bool isSelected;

  UserTypeModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.iconPath,
      this.isSelected = false});
}

List<UserTypeModel> getUserTypeData() {
  final List<UserTypeModel> userTypeList = [
    UserTypeModel(
        id: 0,
        title: "user_lbl",
        iconPath: AppIcon.userNutritionistIcon,
        desc: ""),
    UserTypeModel(
        id: 0,
        title: "nutritionist_lbl",
        iconPath: AppIcon.userNutritionistIcon,
        desc: ""),
    UserTypeModel(
        id: 0,
        title: "fitness_trainer_lbl",
        iconPath: AppIcon.userFitnessIcon,
        desc: ""),
    UserTypeModel(
        id: 0, title: "both_lbl", iconPath: AppIcon.userBothIcon, desc: ""),
  ];

  return userTypeList;
}
