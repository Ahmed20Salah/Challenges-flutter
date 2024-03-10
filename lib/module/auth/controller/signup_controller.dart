import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:global_online/module/auth/view/otp_signup_screen.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/error_toast.dart';
import '../data/data_source/auth_data_source.dart';

class SignUpController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;
  final IAuthDataSource _authDataSource;

  SignUpController(this._authDataSource);

  final TextEditingController numberRegisterController =
      TextEditingController();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController passwordConfirmRegisterController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String errorText = '';
  String sendCode = '';
  String oTPCode = '';
  RxString verificationIdUser = ''.obs;

  Future<void> register() async {
    final registerModel = await _authDataSource.register(
        nameRegisterController.text,
        emailRegisterController.text,
        passwordRegisterController.text,
        passwordConfirmRegisterController.text,
        numberRegisterController.text);
    registerModel.fold((l) => errorToast(l.message), (r) async {
      Get.toNamed(AppRoutes.login);
    });
    // clearTextField();
  }

  @override
  void onInit() {
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.back();
      };
    super.onInit();
  }

  bool showPass = true;
  bool showConfPass = true;

  showPassword() {
    showPass = !showPass;
    update();
  }

  showConfPassword() {
    showConfPass = !showConfPass;
    update();
  }

  Future<void> verifyPhone(String phone) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('Ver credentials$credential');
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              register();
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          errorToast(e.message ?? 'Error');
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIdUser.value = verificationID;
          Get.to(const OtpSignupScreen());
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationIdUser.value = verificationID;
        },
      );
    } catch (e) {}
  }

  Future<void> verifyOTP(String otp) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationIdUser.value, smsCode: otp))
          .then((value) async {
        if (value.user != null) {

          register();
        }
      });
    } catch (e) {
      errorToast(e.toString());
      Get.back();
    }
  }

  @override
  void onClose() {
    super.onClose();
    numberRegisterController.dispose();
    nameRegisterController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    passwordConfirmRegisterController.dispose();
  }
}
