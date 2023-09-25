




import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_online/module/chat/data/data_source/chat_data_source.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../../../core/utils/image_picker/i_image_file.dart';
import '../../../core/utils/image_picker/i_image_picker.dart';
import '../../../core/utils/image_picker/image_picker_input.dart';
import '../../../core/utils/image_picker/image_source.dart';
import '../data/models/all_contact_model.dart';
import '../data/models/create_team_model.dart';

class ChatController extends GetxController{
  final IChatDataSource _chatDataSource;
  final IImagePicker _iImagePicker;

  ChatController(this._chatDataSource, this._iImagePicker);
  RxString participants = ''.obs;
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs ;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<AllContactModel> rxEventDataModel = AllContactModel().obs;

  void setRxEventDataModel(AllContactModel value) => rxEventDataModel.value = value;
  RxList<String> selsect = <String>[].obs;
  void isCheck(Data contactModel) {
    contactModel.isCheck.toggle();

    if (!selsect.value.contains(contactModel.userData?.firebaseUid.toString()) &&
        contactModel.isCheck.value == true) {
      selsect.value.add(contactModel.userData!.firebaseUid.toString());
    } else {
      selsect.value
          .removeWhere((element) => element == contactModel.userData!.firebaseUid.toString());
    }
    print(contactModel.userData?.firebaseUid.toString());
    print(selsect.value.toString().replaceAll('[', '').replaceAll(']', ''));
    participants.value = selsect.value.toString().replaceAll('[', '').replaceAll(']', '');

    update();
    refresh();
  }
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void onInit() {

    super.onInit();
    getAllContact();
  }
  void getAllContact()async{
    setRxRequestStatus(RequestStatus.LOADING);
    final Either<Failure, AllContactModel> allContact =
        await _chatDataSource.allContact();
    allContact.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      errorToast(l.message);
    }, (r) {

      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxEventDataModel(r);
      setRxRequestStatus(RequestStatus.SUCESS);
      update();
    });
  }


  Widget groupSeparatorBuilder(String status) {
    if (status == 'found') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Contact in App'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Invite to App'),
      );
    }
  }
  final _havePickImage = Rx<bool?>(null);
  bool? get havePickImage => _havePickImage.value;
  set havePickImage(bool? newValue) => _havePickImage.value = newValue;

  final _filePickImage = Rx<IImageFile?>(null);
  IImageFile? get filePickImage => _filePickImage.value;
  set filePickImage(IImageFile? newValue) => _filePickImage.value = newValue;

  Future<void> pickImageTeamAvatar() async {
    try {
      final IImageFile? pickedFile = await _iImagePicker.pickImage(
        input: const ImagePickerInput(
          source: ImageSource.gallery,
        ),
      );
      if (pickedFile != null) {
        filePickImage = pickedFile;
        havePickImage = true;
      }
      update();
    } catch (e, ex) {
      debugPrint(ex.toString());
    }
  }



  Future<void> createTeam() async {
    final Either<Failure, CreateTeamModel> update =
    await _chatDataSource.createTeam(
        teamNameController.text.trim(),
        _filePickImage.value,
        participants.value);
    update.fold((l) => errorToast(l.message), (r) {
      successToast(r.message??'Team added successfully' );
      Get.close(0);
    });
  }

  Future<void> newContact()async{
    final Either<Failure, String> update =
    await _chatDataSource.newContact(
        firstNameController.text.trim(),
      lastNameController.text.trim(),
        phoneController.text.trim(),
     );
    update.fold((l) => errorToast(l.message), (r) {
      successToast(r ??'Team added successfully' );
      Get.close(0);
    });
  }
}