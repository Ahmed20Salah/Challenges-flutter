

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/error_toast.dart';
import '../data/data_source/auth_data_source.dart';

class SignUpController extends GetxController{
  late TapGestureRecognizer signUpRecognizer;
  final IAuthDataSource _authDataSource;

  SignUpController(this._authDataSource);

  final TextEditingController numberRegisterController = TextEditingController();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();
  final TextEditingController passwordConfirmRegisterController = TextEditingController();

  Future<void> register(
      String name, String password, String email, String confirmPassword, String phone) async {
    final registerModel =
    await _authDataSource.register(name,email, password, confirmPassword, phone);
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