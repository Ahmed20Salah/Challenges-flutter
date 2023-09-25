

import 'package:get/get.dart';

import '../../../core/utils/error_toast.dart';
import '../data/data_source/home_data_source.dart';

class HomeController extends GetxController{
  final IHomeDataSource _homeDataSource;

  HomeController(this._homeDataSource);


  @override
  void onInit() {
    super.onInit();
    addContact('+972599229320,+972599229820,+972599221120,+972598444111,+972597723826');
  }

  Future<void> addContact(String phones) async {
    final registerModel = await _homeDataSource.addContact(phones);
    registerModel.fold((l) => errorToast(l.message), (r) {
      successToast(r);
    });
  }
}