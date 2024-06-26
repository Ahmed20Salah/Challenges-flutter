import 'package:get/get.dart';
import 'package:global_online/module/challenges/data/data_source/challenges_data_source.dart';

import '../../module/home/controller/home_controller.dart';
import '../../module/home/data/data_source/home_data_source.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDataSource>(
      () => HomeDataSource(
          Get.find<WebServiceConnections>(), Get.find<IConnectivityChecker>()),
    );
    Get.lazyPut<IChallengesDataSource>(
      () => ChallengesDataSource(
        Get.find<WebServiceConnections>(),
        Get.find<IConnectivityChecker>(),
      ),
    );
    Get.lazyPut(() => HomeController(
        Get.find<IHomeDataSource>(), Get.find<IChallengesDataSource>()));
  }
}
