

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:global_online/core/helpers/page_loading_dialog/page_loading_dialog.dart';
import 'package:global_online/core/helpers/show_bottom_sheet/show_bottom_sheet_impl.dart';
import 'package:global_online/core/netwrok/web_connection.dart';
import 'package:global_online/core/utils/connectivity_check/connectivity_checker_impl.dart';
import 'package:global_online/core/utils/connectivity_check/i_connectivity_checker.dart';
import 'package:global_online/core/utils/image_picker/i_image_picker.dart';
import 'package:global_online/core/utils/image_picker/image_picker_impl/real_image_picker.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/_main/controller/main_controller.dart';
import 'package:global_online/module/_main/data/main_data_source.dart';

import '../../module/map/controller/map_controller.dart';
import '../../module/splash/controller/splash_controller.dart';
import '../helpers/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../helpers/show_dialog_helper/i_show_dialog_helper.dart';
import '../helpers/show_dialog_helper/show_dialog_helper.dart';

class MainBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(
          () => Storage(),
    );

    Get.lazyPut(
          () => Dio(),
    );
    Get.put(
          () => Dio(),
      permanent: true,
    );
    Get.put<IPageLoadingDialog>(
      PageLoadingDialog(),
      permanent: true,
    );
    Get.put<IShowBottomSheetHelper>(
      ShowBottomSheetHelperImpl(),
      permanent: true,
    );
    Get.put<IShowDialogHelper>(
      ShowDialogHelperImpl(),
      permanent: true,
    );
    Get.put<IConnectivityChecker>(
      ConnectivityCheckerImpl(),
    );
    Get.put<WebServiceConnections>(
      WebServiceConnections(
        Get.find<Dio>(),
        Get.find<Storage>(),
        Get.find(),
      ),
      permanent: true,
    );
    // Get.put<IShowDialogHelper>(
    //   ShowDialogHelperImpl(),
    //   permanent: true,
    // // );
    // Get.put<IShowBottomSheetHelper>(
    //   ShowBottomSheetHelperImpl(),
    //   permanent: true,
    // );

    // Get.put<IShowSnakBar>(
    //   ShowSnakBarImpl(),
    //   permanent: true,
    // );
    Get.put<IImagePicker>(
      ImagePickerImpl(),
      permanent: true,
    );
    Get.lazyPut(() => SplashController());
    // Get.lazyPut(() => MapController());
    Get.lazyPut<IMainDataSource>(
          () => MainDataSource(
          Get.find<WebServiceConnections>(), Get.find<IConnectivityChecker>()),
    );
    Get.put(MainController(Get.find<IMainDataSource>()));
  }

}