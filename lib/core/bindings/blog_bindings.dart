import 'package:get/get.dart';
import 'package:global_online/module/blogs/controller/blog_controller.dart';
import 'package:global_online/module/blogs/data/data_source/blogs_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class BlogBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IBlogsDataSource>(
        () => BlogsDataSource(Get.find<IConnectivityChecker>(),
            Get.find<WebServiceConnections>()),
        fenix: true);
    Get.lazyPut(() => BlogsController(dataSource: Get.find<IBlogsDataSource>()),
        fenix: true);
  }
}
