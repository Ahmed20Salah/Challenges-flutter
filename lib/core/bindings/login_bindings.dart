


import 'package:get/get.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/auth/controller/login_controller.dart';

import '../../module/auth/data/data_source/auth_data_source.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class LoginBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IAuthDataSource>(
          () => AuthDataSource(
          Get.find<WebServiceConnections>(), Get.find<IConnectivityChecker>()),
    );
  Get.lazyPut(() => LoginController(Get.find<IAuthDataSource>(),Get.find<Storage>()));
  }

}