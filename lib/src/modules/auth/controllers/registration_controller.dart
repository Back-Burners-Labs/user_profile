import '../../../core/api/api.dart';
import '../../../core/app_export.dart';
import '../../../core/models/user.dart' as model;
import '../../../core/utils/app_exceptions.dart';
import '../../../data/dataSource/local/user_type_data.dart';
import '../../panels/user/root/bindings/root_binding.dart';
import '../../panels/user/root/views/root_view.dart';
import '../bindings/auth_binding.dart';
import '../views/login/login_view.dart';
import '../views/registration/registration_view.dart';

class RegistrationController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  RxList<UserTypeModel> userTypes = <UserTypeModel>[].obs;
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  Rx<model.User?> user = Rx<model.User?>(null);
  @override
  void onInit() {
    userTypes.value = getUserTypeData();
    super.onInit();
  }

  changePasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  changeConfirmPasswordObscure() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  onUserTypeSelection(UserTypeModel userType) {
    List<UserTypeModel> tempUserType = <UserTypeModel>[];
    for (var user in userTypes) {
      if (user == userType) {
        user.isSelected = true;
      } else {
        user.isSelected = false;
      }
      tempUserType.add(user);
    }
    userTypes.value = tempUserType;
  }

  onLoginClick() {
    Get.off(() => const LoginView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  onSignUpClick() async {
    Get.off(() => UserRootView(),
        binding: RootBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  _fieldValidation() {
    if (_formEmptyValidation()) {
      if (_emailValidation() && _passwordValidation()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  _formEmptyValidation() {
    if (emailTextController.text.isEmpty &&
        passwordTextController.text.isEmpty) {
      SnackBarX.showError(
          title: "registration_validation_snack_title",
          message: "registration_validation_snack_message");
      return false;
    } else {
      return true;
    }
  }

  _emailValidation() {
    if (!emailTextController.text.isEmail) {
      SnackBarX.showError(
          title: "email_validation_snack_title",
          message: "email_validation_snack_message");
      return false;
    } else {
      return true;
    }
  }

  _passwordValidation() {
    if (passwordTextController.text.length < 6) {
      SnackBarX.showError(
          title: "password_validation_snack_title",
          message: "password_validation_snack_message");
      return false;
    } else {
      if (passwordTextController.text != confirmPasswordTextController.text) {
        SnackBarX.showError(
            title: "password_mismatch_snack_title",
            message: "password_mismatch_snack_message");
        return false;
      } else {
        return true;
      }
    }
  }

  onNextClick() {
    Get.to(() => const RegistrationView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 600),
        transition: Transition.circularReveal);
  }

  onProviderClick(String provider) async {
    Get.off(() => UserRootView(),
        binding: RootBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }
}
