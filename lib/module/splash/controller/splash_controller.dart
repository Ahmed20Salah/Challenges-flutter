

import 'package:get/get.dart';
import 'package:global_online/core/utils/services/storage.dart';

import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController{



  @override
  void onReady() {
    super.onReady();
    print('jwtToken ${Storage().jwtToken}');

    Future.delayed(
      Duration(seconds: 4),
          () {
        if (Storage().jwtToken == null) {
          return Get.toNamed(AppRoutes.login);
        } else {
          return Get.toNamed(AppRoutes.navBar);
        }
      },
    );
  }

  SplashController();
}