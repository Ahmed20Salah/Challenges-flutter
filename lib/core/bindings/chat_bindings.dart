import 'package:get/get.dart';
import 'package:global_online/module/chat/controller/chat_controller.dart';
import 'package:global_online/module/chat/data/data_source/chat_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';
import '../utils/image_picker/i_image_picker.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IChatDataSource>(
        () => ChatDataSource(Get.find<IConnectivityChecker>(),
            Get.find<WebServiceConnections>()),
        fenix: true);
    Get.lazyPut(
        () => ChatController(
            Get.find<IChatDataSource>(), Get.find<IImagePicker>()),
        fenix: true);
  }
}
