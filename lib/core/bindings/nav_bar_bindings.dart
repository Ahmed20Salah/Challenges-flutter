import 'package:get/get.dart';

import '../../module/nav_bar/presentation/manager/nav_bar_controller.dart';

class NavBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController());
  }
}
