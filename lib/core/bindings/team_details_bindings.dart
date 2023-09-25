

import 'package:get/get.dart';
import 'package:global_online/module/team_details/controller/team_details_controller.dart';
import 'package:global_online/module/team_details/data/data_source/team_details_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class TeamDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITeamDetailsDataSource>(
          () => TeamDetailsDataSource(
        Get.find<IConnectivityChecker>(),Get.find<WebServiceConnections>(),),
    );
    Get.lazyPut(() => TeamDetailsController(Get.find<ITeamDetailsDataSource>()));
  }

}