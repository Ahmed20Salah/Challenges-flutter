


import 'package:get/get.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/create_challenges/controller/create_challenge_controller.dart';
import 'package:global_online/module/create_challenges/data/data_source/create_challenge_data_source.dart';

import '../../module/_main/data/main_data_source.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class CreateChallengeBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ICreateChallengeDataSource>(
          () => CreateChallengeDataSource(
        Get.find<IConnectivityChecker>(),Get.find<WebServiceConnections>(),),
    );
    Get.lazyPut(() => CreateChallengeController(Get.find<IMainDataSource>(),Get.find<ICreateChallengeDataSource>()));
  }

}