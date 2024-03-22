import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:global_online/core/utils/services/storage.dart';
import 'package:global_online/module/chat/data/data_source/chat_data_source.dart';
import 'package:global_online/module/chat/view/chat_screen.dart';

import '../../../core/netwrok/failure.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/error_toast.dart';
import '../../../core/utils/image_picker/i_image_file.dart';
import '../../../core/utils/image_picker/i_image_picker.dart';
import '../../../core/utils/image_picker/image_picker_input.dart';
import '../../../core/utils/image_picker/image_source.dart';
import '../data/models/all_contact_model.dart';
import '../data/models/create_team_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatController extends GetxController {
  final IChatDataSource _chatDataSource;
  final IImagePicker _iImagePicker;

  ChatController(this._chatDataSource, this._iImagePicker);
  RxString participants = ''.obs;
  final Rx<RequestStatus> rxRequestStatus = RequestStatus.LOADING.obs;
  void setRxRequestStatus(RequestStatus value) => rxRequestStatus.value = value;
  final Rx<AllContactModel> rxEventDataModel = AllContactModel().obs;

  void setRxEventDataModel(AllContactModel value) =>
      rxEventDataModel.value = value;
  RxList<String> selsect = <String>[].obs;
  void isCheck(Data contactModel) {
    contactModel.isCheck.toggle();

    if (!selsect.value
            .contains(contactModel.userData?.firebaseUid.toString()) &&
        contactModel.isCheck.value == true) {
      selsect.value.add(contactModel.userData!.firebaseUid.toString());
    } else {
      selsect.value.removeWhere((element) =>
          element == contactModel.userData!.firebaseUid.toString());
    }
    participants.value =
        selsect.value.toString().replaceAll('[', '').replaceAll(']', '');
    print('participants $participants');
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

  void getAllContact() async {
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
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Contact in App'),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(8.0),
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
            name: teamNameController.text.trim(),
            avatarTeam: _filePickImage.value,
            userFirebaseUid: participants.string);
    update.fold((l) => errorToast(l.message), (r) {
      successToast(r.message ?? 'Team added successfully');
      createTeamChat(r);
      Get.close(0);
    });
  }

  Future<void> newContact() async {
    final Either<Failure, String> update = await _chatDataSource.newContact(
      firstNameController.text.trim(),
      lastNameController.text.trim(),
      phoneController.text.trim(),
    );
    update.fold((l) => errorToast(l.message), (r) {
      successToast(r ?? 'Team added successfully');
      Get.close(0);
    });
  }

  void createIndiviualRoomChat(UserData userData, context) async {
    String currenctUserId = Storage().firebaseUID!;
    String receiverId = userData.firebaseUid!;
    List<String> ids = [currenctUserId, receiverId];
    ids.sort();
    String roomId = ids.join('_');
    print(Storage().firebaseUID);
    // types.Room room = types.Room(
    //   id: roomId,
    //   type: types.RoomType.direct,
    //   users: users,
    // );

    final navigator = Navigator.of(context);

    FirebaseChatCore.instance
        .setConfig(const FirebaseChatCoreConfig(null, 'Rooms', 'Users'));
    // await FirebaseChatCore.instance.createUserInFirestore(
    //   types.User(
    //     firstName: Storage().fistName!,
    //     id: Storage().firebaseUID!, // UID from Firebase Authentication
    //     lastName: Storage().lastName,
    //   ),
    // );
    // print(await FirebaseChatCore.instance.users().first);
    // print(userData.firebaseUid);
    // final types.Room room = await FirebaseChatCore.instance.createRoom(
    //   types.User(
    //     id: userData.firebaseUid!,
    //     firstName: userData.name,
    //   ),
    // );
    // Map<String, dynamic>? roomData;
    bool isExisted = await FirebaseFirestore.instance
        .collection('/Rooms')
        .doc(roomId)
        .collection('messages')
        .limit(1)
        .get()
        .then((value) => value.size == 0);
    Get.toNamed(AppRoutes.chat, arguments: {
      'roomId': roomId,
      'isNew': isExisted,
      'userData': userData,
    });
    // navigator.pop();
    // await navigator.push(
    //   MaterialPageRoute(
    //     builder: (context) => ChatScreen(
    //       roomId: roomId,
    //       isNew: isExisted,
    //       user: userData,
    //     ),
    //   ),
    // );
  }

  void sendMessage(dynamic partialMessage, String roomId, bool? isPin) async {
    if (FirebaseAuth.instance.currentUser == null) return;

    types.Message? message;

    if (partialMessage is types.PartialCustom) {
      message = types.CustomMessage.fromPartial(
          author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
          id: '',
          partialCustom: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialFile) {
      message = types.FileMessage.fromPartial(
          author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
          id: '',
          partialFile: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialImage) {
      message = types.ImageMessage.fromPartial(
          author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
          id: '',
          remoteId: isPin != null ? 'Pin' : '',
          partialImage: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialText) {
      message = types.TextMessage.fromPartial(
          author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
          id: '',
          partialText: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    }
    print('room Collection' +
        FirebaseChatCore.instance.config.roomsCollectionName);
    print(roomId);
    if (message != null) {
      final messageMap = message.toJson();
      messageMap.removeWhere((key, value) => key == 'author' || key == 'id');
      messageMap['authorId'] = FirebaseAuth.instance.currentUser!.uid;
      messageMap['createdAt'] = FieldValue.serverTimestamp();
      messageMap['updatedAt'] = FieldValue.serverTimestamp();
      await FirebaseChatCore.instance
          .getFirebaseFirestore()
          .collection(
              '${FirebaseChatCore.instance.config.roomsCollectionName}/$roomId/messages')
          .add(messageMap);

      await FirebaseChatCore.instance
          .getFirebaseFirestore()
          .collection(FirebaseChatCore.instance.config.roomsCollectionName)
          .doc(roomId)
          .update({'updatedAt': FieldValue.serverTimestamp()});
    }
  }

  createTeamChat(CreateTeamModel createTeamModel) async {
    await FirebaseChatCore.instance.createGroupRoom(
        name: createTeamModel.data!.name!,
        imageUrl: createTeamModel.data!.image,
        users: createTeamModel.users!.map((e) => types.User(id: e)).toList());
  }
}
