

import 'package:get/get.dart';
import 'package:global_online/module/my_team/controller/my_team_controller.dart';
import 'package:global_online/module/my_team/data/data_source/my_team_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class MyTeamBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IMyTeamDataSource>(
          () => MyTeamDataSource(
           Get.find<IConnectivityChecker>(),Get.find<WebServiceConnections>(),),
    );
    Get.lazyPut(() => MyTeamController(Get.find<IMyTeamDataSource>()));
  }

}