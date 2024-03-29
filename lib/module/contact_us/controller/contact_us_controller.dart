import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/core/errors/handle_error.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/contact_us/data/data_source/contact_us_data_source.dart';

import '../../../core/utils/constant.dart';

class ContactUsController extends GetxController {
  final IContactUsDataSource dataSource;
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs;
  final TextEditingController title = TextEditingController();
  final TextEditingController message = TextEditingController();

  ContactUsController({required this.dataSource});
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;

  sendMessage() {
    setRxRequestStatus(RequestStatus.LOADING);
    dataSource.sendMessage({'title': title.text, 'message': message.text}).then(
        (value) =>
            value.fold((l) => setRxRequestStatus(RequestStatus.ERROR), (r) {
              print('success');
              title.clear();
              message.clear();
              Get.showSnackbar(Get.snackbar(
                "Your message Sent successfully",
                '',
                colorText: ColorManager.white,
                backgroundColor: ColorManager.activeIcon,
                icon: const Icon(Icons.add_alert),
              ).snackbar);
              setRxRequestStatus(RequestStatus.SUCESS);
            }));
  }
}
