


import 'package:get/get.dart';
import 'package:global_online/module/challenges/controller/challenges_controller.dart';

import '../../module/challenges/data/data_source/challenges_data_source.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class ChallengesBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IChallengesDataSource>(
            () => ChallengesDataSource(
             Get.find<WebServiceConnections>(),Get.find<IConnectivityChecker>(),),
    );
    Get.lazyPut(() => ChallengesController(Get.find<IChallengesDataSource>()));
  }

}