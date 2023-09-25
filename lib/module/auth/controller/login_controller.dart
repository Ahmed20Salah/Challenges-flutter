
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:global_online/core/utils/error_toast.dart';
import 'package:global_online/core/utils/services/storage.dart';

import '../../../core/routes/app_routes.dart';
import '../data/data_source/auth_data_source.dart';
import '../view/otp_screen.dart';

class LoginController extends GetxController{
  late TapGestureRecognizer signUpRecognizer;
  String errorText = '';
  String sendCode = '';
  String oTPCode = '';
  RxString verificationIdUser = ''.obs;
  final TextEditingController loginNumberController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final IAuthDataSource _authDataSource;
  final Storage _storage;

  LoginController(this._authDataSource, this._storage);

  @override
  void onInit() {
    super.onInit();
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Get.offAllNamed(AppRoutes.navBar);
        Get.toNamed(AppRoutes.register);
      };
  }

  Future<void> login(
      String uid) async {
    final loginModel =
    await _authDataSource.login(uid);
    loginModel.fold((l) => errorToast(l.message), (r) async {
      _storage.fistName = r.data?.name;
      _storage.firebaseUID = r.data?.firebaseUid;
      _storage.phoneNumber = r.data?.phone;
      _storage.jwtToken = r.data?.apiToken;
      _storage.fcmToken = r.data?.fcmToken;
      _storage.type= r.data?.type;

      successToast(r.message??'');
      Get.offAllNamed(AppRoutes.navBar);
    });
    // clearTextField();
  }



  Future<void> verifyPhone(String phone) async {
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) async {
              if (value.user != null) {
                login(value.user?.uid??'');
              }
            });

          },
          verificationFailed: (FirebaseAuthException e) {
            errorToast(e.message??'Error');
          },
          codeSent: (String verificationID, int? resendToken) {
            verificationIdUser.value = verificationID;
            Get.to(OtpScreen());


          },
          codeAutoRetrievalTimeout: (String verificationID) {
            verificationIdUser.value = verificationID;
          },
         );
    }catch (e){

    }

  }


  Future<void> verifyOTP(String otp) async{
    try {
   await FirebaseAuth.instance.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationIdUser.value, smsCode: otp)).then((value)  async {
     if (value.user != null) {
       login(value.user?.uid??'');
     }

   } );

    }catch(e){
      errorToast(e.toString());
      Get.back();

    }
  }





}