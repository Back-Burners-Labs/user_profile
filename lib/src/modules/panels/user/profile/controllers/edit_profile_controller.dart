import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import '../../../../../core/app_export.dart';
import '../../../../../data/dataSource/local/preference_data.dart';
import '../../../../../modules/panels/user/preference/controllers/preference_controller.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/models/image_size_model.dart';
import '../../../../../core/models/setting_option_model.dart';
import '../../../../auth/controllers/login_controller.dart';

class EditProfileController extends GetxController {
  final PreferenceController _preferenceController = Get.find();

  PageController editPreferencePageController = PageController();
  RxInt currentIndex = 0.obs;
  List<PreferenceModel> preferenceWidgets = getEditPreferenceData();
  RxString selectedProfileImagePath = "".obs;
  final ImagePicker _picker = ImagePicker();
  Rx<OptionModel> selectedImageSourceOption = OptionModel(false, "", "").obs;
  List<OptionModel> imageSourceOptionData = [
    OptionModel(true, 'Gallery',
        "Please select the image, you want to upload from your gallery."),
    OptionModel(false, 'Camera',
        "Please capture the image, you want to upload directly from your camera.")
  ];
  selectImage() async {
    selectedProfileImagePath.value =
        await imagePickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
  }

  TextEditingController firstNameTextController = TextEditingController();
  RxBool showFirstNameError = false.obs;
  TextEditingController lastNameTextController = TextEditingController();
  RxBool showLastNameError = false.obs;
  TextEditingController ageTextController = TextEditingController();
  RxBool showAgeError = false.obs;
  TextEditingController weightTextController = TextEditingController();
  RxBool showWeightError = false.obs;
  TextEditingController heightTextController = TextEditingController();
  RxBool showHeightError = false.obs;
  RxList<PreferenceGeneralModel> selectedPreferenceList =
      <PreferenceGeneralModel>[].obs;
  RxList<PreferenceGeneralModel> selectedPreferenceTrainingDayList =
      <PreferenceGeneralModel>[].obs;

  Rx<PreferenceGeneralModel> selectedGoal = PreferenceGeneralModel().obs;
  Rx<PreferenceGeneralModel> selectedMeal = PreferenceGeneralModel().obs;
  Rx<PreferenceGeneralModel> selectedActivity = PreferenceGeneralModel().obs;
  Rx<PreferenceGeneralModel> selectedPhysicalActivity =
      PreferenceGeneralModel().obs;
  RxString editPreferenceTitle = "goal_lbl".obs;
  Future<String> imagePickFromSource(ImageSize imageSize) async {
    ImageSource imageSource =
        (selectedImageSourceOption.value == imageSourceOptionData[0])
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

  @override
  void onInit() {
    selectedImageSourceOption.value = imageSourceOptionData[0];
    firstNameTextController.text =
        _preferenceController.firstNameTextController.text;
    lastNameTextController.text =
        _preferenceController.lastNameTextController.text;
    ageTextController.text =
        _preferenceController.currentAgeValue.value.toString();
    weightTextController.text =
        _preferenceController.currentWeightValue.value.toString();
    heightTextController.text =
        _preferenceController.currentHeightCmValue.value.toString();
    selectedPreferenceList.value = _preferenceController.selectedPreferenceList;
    selectedPreferenceTrainingDayList.value =
        _preferenceController.selectedPreferenceTrainingDayList;

    super.onInit();
  }

  void doneEditingPreference() {
    if (currentIndex.value == 0) {
      pageChange();
      editPreferenceTitle.value = "Physical Activity Level";
      return;
    }
    if (currentIndex.value == 1) {
      pageChange();
      editPreferenceTitle.value = "Diet Preference";
      return;
    }
    if (currentIndex.value == 2) {
      pageChange();
      editPreferenceTitle.value = "Physical Activity Preference";
      return;
    }
    if (currentIndex.value == 3) {
      pageChange();
      return;
    }
    if (currentIndex.value == 4) {
      pageChange();
      return;
    }
  }

  pageChange() {
    currentIndex.value++;
    if (currentIndex.value == preferenceWidgets.length) {
      getPreferenceDataFromController();
      currentIndex.value = 0;
      Get.back();
    } else {
      editPreferencePageController.jumpToPage(currentIndex.value);
    }
  }

  doneEditingTrainingDay() {
    selectedPreferenceTrainingDayList.value =
        _preferenceController.selectedPreferenceTrainingDayList;
    Get.back();
  }

  getPreferenceDataFromController() {
    selectedPreferenceList.value = _preferenceController.selectedPreferenceList;
  }

  saveProfileChanges() async {
    Get.back();

    final user = Get.find<LoginController>().user();
    final resource = CloudinaryUploadResource(
        filePath: selectedProfileImagePath.value,
        resourceType: CloudinaryResourceType.image,
        folder: "UserProfileImages",
        fileName: '${user!.id}-profile-img.png');
    final profileImg = await Get.find<Cloudinary>().uploadResource(resource);

    if (profileImg.isResultOk) {
      user.profileImageUrl = profileImg.secureUrl;
      user.firstName = firstNameTextController.text;
      user.lastName = lastNameTextController.text;
      UserApi().update(user.id!, user.toJson());
      Get.find<LoginController>().update();
      SnackBarX.showSuccess(
          title: "profile_update_snack_title",
          message: "profile_update_snack_message");
    }
  }
}
