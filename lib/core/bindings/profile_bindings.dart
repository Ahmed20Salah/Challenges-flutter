

import 'package:get/get.dart';
import 'package:global_online/module/profile/controller/profile_controller.dart';
import 'package:global_online/module/profile/data/data_source/profile_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileDataSource>(
          () => ProfileDataSource(
        Get.find<IConnectivityChecker>(),Get.find<WebServiceConnections>(),),
    );
    Get.lazyPut(() => ProfileController( Get.find<IProfileDataSource>()));
  }

}