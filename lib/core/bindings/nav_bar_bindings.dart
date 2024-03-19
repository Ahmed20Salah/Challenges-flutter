import 'package:get/get.dart';

import '../../module/chat/data/data_source/chat_data_source.dart';
import '../../module/nav_bar/presentation/manager/nav_bar_controller.dart';
import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class NavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IChatDataSource>(
        () => ChatDataSource(Get.find<IConnectivityChecker>(),
            Get.find<WebServiceConnections>()),
        fenix: true);
    Get.lazyPut(() => NavBarController(Get.find<IChatDataSource>()));
  }
}
