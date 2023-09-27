
import 'package:get/get.dart';
import 'package:global_online/module/challenge_details/controller/challenge_details_controller.dart';
import 'package:global_online/module/challenge_details/data/data_source/challenge_details_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class ChallengesDetailsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IChallengeDetailsDataSource>(
          () => ChallengeDetailsDataSource(
        Get.find<WebServiceConnections>(),Get.find<IConnectivityChecker>(),),
    );
    Get.lazyPut(() => ChallengeDetailsController(Get.find<IChallengeDetailsDataSource>()));
  }

}