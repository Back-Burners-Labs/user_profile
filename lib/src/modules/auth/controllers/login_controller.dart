// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/api/api.dart';
import '../../../core/utils/app_exceptions.dart';
import '../../../core/app_export.dart';
import '../../../core/models/models.dart' as model;
// import '../../panels/gym/root/bindings/root_binding.dart';
// import '../../panels/gym/root/views/root_view.dart';
import '../../panels/user/root/bindings/root_binding.dart';
import '../../panels/user/root/views/root_view.dart';
import '../bindings/auth_binding.dart';
import '../views/additional/foreget_password_view.dart';
import '../views/additional/reset_password_view.dart';
import '../views/additional/verification_code_view.dart';
import '../views/login/login_view.dart';
import '../views/registration/registration_view.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailTextController = TextEditingController().obs;
  Rx<TextEditingController> passwordTextController =
      TextEditingController().obs;
  TextEditingController confirmPasswordTextController = TextEditingController();

  TextEditingController oldPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController newConfirmPasswordTextController =
      TextEditingController();

  TextEditingController pinCodeTextController = TextEditingController();

  RxBool isUserSelected = true.obs;
  RxBool isAdminSelected = false.obs;
  RxBool isTrainerSelected = false.obs;

  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;

  Rx<model.User?> user = Rx<model.User?>(null);

  Future<Box> boxOpened = Hive.openBox('tokens');

  @override
  void onInit() {
    onUserSelection();
    _fetchUser();
    super.onInit();
  }

  changeObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  changeConfirmPasswordObscure() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  void signUpClick() {
    Get.off(() => const RegistrationView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  Future loginClick() async {
    Get.off(() => UserRootView(),
        binding: RootBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  _signInWithCredential() async {
    Get.off(() => UserRootView(),
        binding: RootBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void forgotPasswordClick() {
    Get.to(() => const ForgotPasswordView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void sendCodeClick() {
    Get.to(() => const VerificationCodeView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void confirmCodeClick() {
    Get.to(() => const ResetPasswordView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void onClickResend() {}

  void onClickChangePassword() {
    Get.to(() => const LoginView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void onClickAuthChangePassword() {
    Get.back();
  }

  onUserSelection() {
    isAdminSelected.value = false;
    isTrainerSelected.value = false;
    isUserSelected.value = true;
    emailTextController.value.text = "user@gmail.com";
    passwordTextController.value.text = "123";
  }

  onAdminSelection() {
    isAdminSelected.value = true;
    isTrainerSelected.value = false;
    isUserSelected.value = false;
    emailTextController.value.text = "";
    passwordTextController.value.text = "";
  }

  onTrainerSelection() {
    isAdminSelected.value = false;
    isTrainerSelected.value = true;
    isUserSelected.value = false;
    emailTextController.value.text = "";
    passwordTextController.value.text = "";
  }

  Future _fetchUser() async {
    try {
      if (id != null) {
        user.value = await UserApi().getById(id!);
      }
    } on ApiException catch (e) {
      Get.snackbar('Authentification Failed', e.message ?? '');
    }
  }

  static Box get tokens => Hive.box('tokens');
  static String? get accessToken => tokens.get('access_token');
  static String? get refreshToken => tokens.get('refresh_token');
  static int? get id => tokens.get('id');

  onProviderClick(String provider) async {
    /*if (provider == 'Google') {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _signInWithCredential(
          await Get.find<FirebaseAuth>().signInWithCredential(credential));
    }*/
  }

  Future<bool> get isLogged async {
    await boxOpened;
    return accessToken != null;
  }
}
