import '../../../core/app_export.dart';
import '../../../modules/panels/user/preference/views/age_input_view.dart';
import '../../../modules/panels/user/preference/views/height_input_view.dart';
import '../../../modules/panels/user/preference/views/name_input_view.dart';
import '../../../modules/panels/user/preference/views/overview_view.dart';

class PreferenceModel {
  int id;
  String questionOne;
  String questionHighlight;
  Widget widget;
  String imagePath;

  PreferenceModel({
    required this.id,
    required this.questionOne,
    required this.questionHighlight,
    required this.widget,
    required this.imagePath,
  });
}

class PreferenceGeneralModel {
  int? id;
  String? title;
  String? desc;
  bool? isSelected;
  String? imagePath;

  PreferenceGeneralModel(
      {this.id,
      this.title,
      this.desc,
      this.isSelected = false,
      this.imagePath});
}

List<PreferenceModel> getPreferenceData() {
  final List<PreferenceModel> preferences = [
    PreferenceModel(
      id: 0,
      questionOne: "preference_q_one",
      questionHighlight: "preference_qh_one",
      imagePath: "",
      widget: const NameInputView(),
    ),
    PreferenceModel(
      id: 1,
      questionOne: "preference_q_two",
      questionHighlight: "preference_qh_two",
      imagePath: "",
      widget: const AgeInputView(),
    ),
    PreferenceModel(
      id: 2,
      questionOne: "preference_q_three",
      questionHighlight: "preference_qh_three",
      imagePath: "",
      widget: const HeightInputView(),
    ),

    PreferenceModel(
      id: 10,
      questionOne: "preference_q_overview",
      questionHighlight: "preference_qh_overview",
      imagePath: "",
      widget: const OverViewView(),
    ),
  ];

  return preferences;
}

List<PreferenceModel> getEditPreferenceData() {
  final List<PreferenceModel> preferences = [];

  return preferences;
}

List<PreferenceGeneralModel> getPreferenceQuestionData() {
  final List<PreferenceGeneralModel> questions = [
    PreferenceGeneralModel(
        id: 0, title: "preference_q_one", desc: "preference_qh_one"),
    PreferenceGeneralModel(
        id: 1, title: "preference_q_two", desc: "preference_qh_two"),
    PreferenceGeneralModel(
        id: 2, title: "preference_q_three", desc: "preference_qh_three"),
    PreferenceGeneralModel(
        id: 3, title: "preference_q_four", desc: "preference_qh_four"),
    PreferenceGeneralModel(
        id: 4, title: "preference_q_five", desc: "preference_qh_five"),
    PreferenceGeneralModel(
        id: 5, title: "preference_q_six", desc: "preference_qh_six"),
    PreferenceGeneralModel(
        id: 6, title: "preference_q_seven", desc: "preference_qh_seven"),
    PreferenceGeneralModel(
        id: 7, title: "preference_q_eight", desc: "preference_qh_eight"),
    PreferenceGeneralModel(
        id: 8, title: "preference_q_nine", desc: "preference_qh_nine"),
    PreferenceGeneralModel(
        id: 9, title: "preference_q_ten", desc: "preference_qh_ten"),
    PreferenceGeneralModel(
        id: 10, title: "preference_q_overview", desc: "preference_qh_overview")
  ];
  return questions;
}

List<PreferenceGeneralModel> getPreferenceGoalData() {
  final List<PreferenceGeneralModel> goals = [
    PreferenceGeneralModel(
        id: 0, title: "goal_one_title", desc: "goal_one_desc"),
    PreferenceGeneralModel(
        id: 1, title: "goal_two_title", desc: "goal_two_desc"),
    PreferenceGeneralModel(
        id: 2, title: "goal_three_title", desc: "goal_three_desc"),
    PreferenceGeneralModel(
        id: 3, title: "goal_four_title", desc: "goal_four_desc"),
  ];
  return goals;
}

List<PreferenceGeneralModel> getPreferenceActivityData() {
  final List<PreferenceGeneralModel> activities = [
    PreferenceGeneralModel(
        id: 0, title: "activity_one_title", desc: "activity_one_desc"),
    PreferenceGeneralModel(
        id: 1, title: "activity_two_title", desc: "activity_two_desc"),
    PreferenceGeneralModel(
        id: 2, title: "activity_three_title", desc: "activity_three_desc"),
    PreferenceGeneralModel(
        id: 3, title: "activity_four_title", desc: "activity_four_desc"),
  ];
  return activities;
}

List<PreferenceGeneralModel> getPreferenceMealData() {
  final List<PreferenceGeneralModel> meals = [
    PreferenceGeneralModel(
        id: 0,
        title: "meal_one_title",
        desc: "meal_one_desc",
        imagePath: AppIcon.allFoodIcon),
    PreferenceGeneralModel(
        id: 1,
        title: "meal_two_title",
        desc: "meal_two_desc",
        imagePath: AppIcon.vegetarianIcon),
    PreferenceGeneralModel(
        id: 2,
        title: "meal_three_title",
        desc: "meal_three_desc",
        imagePath: AppIcon.veganIcon),
    PreferenceGeneralModel(
        id: 3,
        title: "meal_four_title",
        desc: "meal_four_desc",
        imagePath: AppIcon.ketoIcon),
  ];
  return meals;
}

List<PreferenceGeneralModel> getPreferencePhysicalActivityData() {
  final List<PreferenceGeneralModel> physicalActivityList = [
    PreferenceGeneralModel(
        id: 0,
        title: "physical_activity_one_title",
        desc: "physical_activity_one_desc",
        imagePath: AppIcon.runningIcon),
    PreferenceGeneralModel(
        id: 1,
        title: "physical_activity_two_title",
        desc: "physical_activity_two_desc",
        imagePath: AppIcon.walkingIcon),
    PreferenceGeneralModel(
        id: 2,
        title: "physical_activity_three_title",
        desc: "physical_activity_three_desc",
        imagePath: AppIcon.cyclingIcon),
    PreferenceGeneralModel(
        id: 3,
        title: "physical_activity_four_title",
        desc: "physical_activity_four_desc",
        imagePath: AppIcon.gymIcon),
    PreferenceGeneralModel(
        id: 4,
        title: "physical_activity_five_title",
        desc: "physical_activity_five_desc",
        imagePath: AppIcon.yogaIcon),
  ];
  return physicalActivityList;
}

List<PreferenceGeneralModel> getPreferenceTrainingDayData() {
  final List<PreferenceGeneralModel> trainingDayList = [
    PreferenceGeneralModel(
        id: 0,
        title: "training_day_one_title",
        desc: "training_day_one_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 1,
        title: "training_day_two_title",
        desc: "training_day_two_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 2,
        title: "training_day_three_title",
        desc: "training_day_three_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 3,
        title: "training_day_four_title",
        desc: "training_day_four_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 4,
        title: "training_day_five_title",
        desc: "training_day_five_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 5,
        title: "training_day_six_title",
        desc: "training_day_six_desc",
        imagePath: ""),
    PreferenceGeneralModel(
        id: 6,
        title: "training_day_seven_title",
        desc: "training_day_seven_desc",
        imagePath: ""),
  ];
  return trainingDayList;
}
