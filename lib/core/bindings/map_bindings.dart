

import 'package:get/get.dart';
import 'package:global_online/module/map/controller/map_controller.dart';
import 'package:global_online/module/map/data/data_source/map_data_source.dart';

import '../netwrok/web_connection.dart';
import '../utils/connectivity_check/i_connectivity_checker.dart';

class MapBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IMapDatasource>(
          () => MapDataSource(
           Get.find<IConnectivityChecker>(),Get.find<WebServiceConnections>(),),
    );
   Get.lazyPut(() => MapController(Get.find<IMapDatasource>()));
  }

}