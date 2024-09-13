import 'package:image_picker/image_picker.dart';
import '../../../../../core/app_export.dart';
import '../../../../../modules/auth/controllers/login_controller.dart';
import '../../../../../data/dataSource/local/preference_data.dart';
import '../../../../../modules/panels/user/root/bindings/root_binding.dart';
import '../../../../../modules/panels/user/root/views/root_view.dart';
import '../../../../../core/models/image_size_model.dart';
import '../../../../../core/models/setting_option_model.dart';

class PreferenceController extends GetxController {
  PageController pageController = PageController();
  RxString selectedProfileImagePath = "".obs;
  final ImagePicker _picker = ImagePicker();
  TextEditingController firstNameTextController = TextEditingController();
  RxBool showFirstNameError = false.obs;
  TextEditingController lastNameTextController = TextEditingController();
  RxBool showLastNameError = false.obs;
  final FixedExtentScrollController cmScaleController =
      FixedExtentScrollController(initialItem: 179);
  final FixedExtentScrollController hrScaleController =
      FixedExtentScrollController(initialItem: 5);
  final FixedExtentScrollController feetScaleController =
      FixedExtentScrollController(initialItem: 5);
  final FixedExtentScrollController inchesScaleController =
      FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController lbsWeightScaleController =
      FixedExtentScrollController(initialItem: 179);
  final FixedExtentScrollController kgWeightScaleController =
      FixedExtentScrollController(initialItem: 82);
  final List<int> cmList = List.generate(240, (index) => index + 1);
  final List<int> hrList = List.generate(24, (index) => index + 1);
  final List<int> feetList = List.generate(20, (index) => index + 1);
  final List<int> inchesList = List.generate(12, (index) => index);
  final List<int> lbsWeightList = List.generate(401, (index) => index);
  final List<int> kgWeightList = List.generate(181, (index) => index);

  List<PreferenceGeneralModel> preferenceQuestionList =
      getPreferenceQuestionData();
  RxList<PreferenceGeneralModel> preferenceGoalList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> preferenceActivityList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> preferenceMealList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> preferencePhysicalActivityList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> preferenceTrainingDayList =
      <PreferenceGeneralModel>[].obs;
  List<PreferenceModel> preferenceWidgets = getPreferenceData();
  PreferenceGeneralModel? selectedGoal;
  PreferenceGeneralModel? selectedMeal;
  PreferenceGeneralModel? selectedActivity;
  PreferenceGeneralModel? selectedPhysicalActivity;
  RxList<PreferenceGeneralModel> selectedPreferenceList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> selectedPreferenceTrainingDayList =
      <PreferenceGeneralModel>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt currentAgeValue = 21.obs;
  RxInt currentHeightCmValue = 180.obs;
  RxInt currentWeightValue = 186.obs;
  RxInt currentHeightFtValue = 6.obs;
  RxInt currentHeightInchValue = 0.obs;
  RxInt currentSleepHoursValue = 6.obs;
  RxString buttonText = "Next".obs;
  RxString preferenceQuestion = "What's Your".obs;
  RxString preferenceQuestionHighlight = "Name".obs;
  RxBool isHeightTabOneSelected = true.obs;
  RxBool isWeightTabOneSelected = true.obs;
  Rx<OptionModel> selectedImageSourceOption = OptionModel(false, "", "").obs;
  List<OptionModel> imageSourceOptionData = [
    OptionModel(true, 'Gallery',
        "Please select the image, you want to upload from your gallery."),
    OptionModel(false, 'Camera',
        "Please capture the image, you want to upload directly from your camera.")
  ];
  @override
  void onInit() {
    selectedImageSourceOption.value = imageSourceOptionData[0];
    preferenceGoalList.value = getPreferenceGoalData();
    preferenceActivityList.value = getPreferenceActivityData();
    preferenceMealList.value = getPreferenceMealData();
    preferencePhysicalActivityList.value = getPreferencePhysicalActivityData();
    preferenceTrainingDayList.value = getPreferenceTrainingDayData();
    final user = Get.find<LoginController>().user();
    firstNameTextController.text = user?.firstName ?? '';
    lastNameTextController.text = user?.lastName ?? '';
    super.onInit();
  }

  void finishClick() {
    if (nameFormValidation() && currentIndex.value < 4) {
      pageChange();
      return;
    }
    if (currentIndex.value == 4) {
      if (selectedGoal != null) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 5) {
      if (selectedActivity != null) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 6) {
      if (selectedMeal != null) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 7) {
      if (selectedPhysicalActivity != null) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 8) {
      if (currentSleepHoursValue > 1) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 9) {
      if (selectedPreferenceTrainingDayList.isNotEmpty) {
        pageChange();
        return;
      }
    }
    if (currentIndex.value == 10) {
      pageChange();
      return;
    }
  }

  pageChange() {
    currentIndex.value++;
    if (currentIndex.value == preferenceWidgets.length) {
      Get.off(() => UserRootView(),
          binding: RootBinding(),
          duration: const Duration(milliseconds: 400),
          transition: Transition.fadeIn);
    } else {
      if (currentIndex.value == preferenceWidgets.length - 1) {
        buttonText.value = "Finish";
      }
      preferenceQuestion.value =
          preferenceWidgets[currentIndex.value].questionOne;
      preferenceQuestionHighlight.value =
          preferenceWidgets[currentIndex.value].questionHighlight;
      pageController.jumpToPage(currentIndex.value);
    }
  }

  void backClick() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      buttonText.value = "Continue";
      preferenceQuestion.value =
          preferenceWidgets[currentIndex.value].questionOne;
      preferenceQuestionHighlight.value =
          preferenceWidgets[currentIndex.value].questionHighlight;
      pageController.jumpToPage(currentIndex.value);
    } else {
      if (currentIndex.value == 0) {
        Get.back();
      }
    }
  }

  selectImage() async {
    selectedProfileImagePath.value =
        await imagePickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
  }

  Future<String> imagePickFromSource(ImageSize imageSize) async {
    ImageSource imageSource =
        selectedImageSourceOption.value == imageSourceOptionData[0]
            ? ImageSource.gallery
            : ImageSource.camera;
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      maxWidth: imageSize.maxWidth,
      maxHeight: imageSize.maxHeight,
      imageQuality: 100,
    );
    return pickedFile!.path;
  }

  bool nameFormValidation() {
    if (firstNameTextController.text == "" &&
        lastNameTextController.text == "") {
      showFirstNameError.value = true;
      showLastNameError.value = true;
      return false;
    } else if (firstNameTextController.text.isNotEmpty &&
        lastNameTextController.text == "") {
      showFirstNameError.value = false;
      showLastNameError.value = true;
      return false;
    } else if (firstNameTextController.text == "" &&
        lastNameTextController.text.isNotEmpty) {
      showFirstNameError.value = true;
      showLastNameError.value = false;
      return false;
    } else {
      showFirstNameError.value = false;
      showLastNameError.value = false;
      return true;
    }
  }

  onGoalSelection(PreferenceGeneralModel preferenceGeneralModel) {
    List<PreferenceGeneralModel> tempPrefList = <PreferenceGeneralModel>[];
    for (var pref in preferenceGoalList) {
      if (pref == preferenceGeneralModel) {
        pref.isSelected = true;
        selectedGoal = pref;
        if (selectedPreferenceList.isNotEmpty) {
          selectedPreferenceList[0] = (selectedGoal!);
        } else {
          selectedPreferenceList.add(selectedGoal!);
        }
      } else {
        pref.isSelected = false;
      }
      tempPrefList.add(pref);
    }
    preferenceGoalList.value = tempPrefList;
  }

  onActivitySelection(PreferenceGeneralModel preferenceGeneralModel) {
    List<PreferenceGeneralModel> tempPrefList = <PreferenceGeneralModel>[];
    for (var pref in preferenceActivityList) {
      if (pref == preferenceGeneralModel) {
        pref.isSelected = true;
        selectedActivity = pref;
        if (selectedPreferenceList.length > 1) {
          selectedPreferenceList[1] = (selectedActivity!);
        } else {
          selectedPreferenceList.add(selectedActivity!);
        }
      } else {
        pref.isSelected = false;
      }
      tempPrefList.add(pref);
    }
    preferenceActivityList.value = tempPrefList;
  }

  onMealSelection(PreferenceGeneralModel preferenceGeneralModel) {
    List<PreferenceGeneralModel> tempPrefList = <PreferenceGeneralModel>[];
    for (var pref in preferenceMealList) {
      if (pref == preferenceGeneralModel) {
        pref.isSelected = true;
        selectedMeal = pref;
        if (selectedPreferenceList.length > 2) {
          selectedPreferenceList[2] = (selectedMeal!);
        } else {
          selectedPreferenceList.add(selectedMeal!);
        }
      } else {
        pref.isSelected = false;
      }
      tempPrefList.add(pref);
    }
    preferenceMealList.value = tempPrefList;
  }

  onPhysicalActivitySelection(PreferenceGeneralModel preferenceGeneralModel) {
    List<PreferenceGeneralModel> tempPrefList = <PreferenceGeneralModel>[];
    for (var pref in preferencePhysicalActivityList) {
      if (pref == preferenceGeneralModel) {
        pref.isSelected = true;
        selectedPhysicalActivity = pref;
        if (selectedPreferenceList.length > 3) {
          selectedPreferenceList[3] = (selectedPhysicalActivity!);
        } else {
          selectedPreferenceList.add(selectedPhysicalActivity!);
        }
      } else {
        pref.isSelected = false;
      }
      tempPrefList.add(pref);
    }
    preferencePhysicalActivityList.value = tempPrefList;
  }

  onTrainingDaySelection(PreferenceGeneralModel preferenceGeneralModel) {
    List<PreferenceGeneralModel> tempPrefList = <PreferenceGeneralModel>[];
    for (var pref in preferenceTrainingDayList) {
      if (pref == preferenceGeneralModel) {
        pref.isSelected = !preferenceGeneralModel.isSelected!;
        if (pref.isSelected == true) {
          selectedPreferenceTrainingDayList.add(pref);
        } else {
          selectedPreferenceTrainingDayList.remove(pref);
        }
      }
      tempPrefList.add(pref);
    }
    preferenceTrainingDayList.value = tempPrefList;
  }
}
