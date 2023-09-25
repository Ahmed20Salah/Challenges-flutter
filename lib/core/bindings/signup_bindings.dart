

import 'package:get/get.dart';

import '../../module/auth/controller/signup_controller.dart';
import '../../module/auth/data/data_source/auth_data_source.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class SignUpBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IAuthDataSource>(
          () => AuthDataSource(
          Get.find<WebServiceConnections>(), Get.find<IConnectivityChecker>()),
    );
    Get.lazyPut(() => SignUpController(Get.find<IAuthDataSource>(),));
  }

}