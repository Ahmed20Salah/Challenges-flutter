import 'package:get/get.dart';
import 'package:global_online/module/contact_us/controller/contact_us_controller.dart';
import 'package:global_online/module/contact_us/data/data_source/contact_us_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class ContactUsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IContactUsDataSource>(
        () => ContactUsDataSource(Get.find<IConnectivityChecker>(),
            Get.find<WebServiceConnections>()),
        fenix: true);
    Get.lazyPut(
        () => ContactUsController(dataSource: Get.find<IContactUsDataSource>()),
        fenix: true);
  }
}
