import 'dart:developer';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/chat/data/models/all_contact_model.dart';
import 'package:global_online/module/chat/data/models/message_model.dart';
import 'package:global_online/module/chat/widgets/message_bubble.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/netwrok/web_connection.dart';
import '../../../core/utils/services/storage.dart';
import 'package:http/http.dart' as http;

// import 'flutter';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late bool _isNew;
  final TextEditingController _controller = TextEditingController();
  late Room? room;
  late String roomId;
  late Map<String, dynamic>? user;
  late bool isTeam;
  bool _isAttachmentUploading = false;

  void sendMessage(dynamic partialMessage) async {
    if (FirebaseAuth.instance.currentUser == null) return;

    types.Message? message;
    if (_isNew) {
      FirebaseFirestore.instance.collection('Rooms').doc(roomId).set({
        'updatedAt': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
        "type": "direct",
        "name": user!['fristName'],
        'imageUrl': user!['avatar'],
        "userIds": [roomId.split('_')[0], roomId.split('_')[1]]
      });
      _isNew = false;
    }
    if (partialMessage is types.PartialCustom) {
      message = types.CustomMessage.fromPartial(
          author: types.User(
              id: FirebaseAuth.instance.currentUser!.uid,
              firstName: Storage().fistName,
              lastName: Storage().lastName,
              imageUrl: Storage().avatar),
          id: '',
          partialCustom: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialFile) {
      message = types.FileMessage.fromPartial(
          author: types.User(
              id: FirebaseAuth.instance.currentUser!.uid,
              firstName: Storage().fistName,
              lastName: Storage().lastName,
              imageUrl: Storage().avatar),
          id: '',
          partialFile: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialImage) {
      message = types.ImageMessage.fromPartial(
          author: types.User(
              id: FirebaseAuth.instance.currentUser!.uid,
              firstName: Storage().fistName,
              lastName: Storage().lastName,
              imageUrl: Storage().avatar),
          id: '',
          partialImage: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    } else if (partialMessage is types.PartialText) {
      message = types.TextMessage.fromPartial(
          author: types.User(
              id: Storage().userId ?? '',
              firstName: Storage().fistName,
              lastName: 'Salah',
              imageUrl: API.imageUrl(
                  'images/ZNfcDzTGkHgLrNNac1Z9EaajETwVSotXPiNYrBzq.jpg')),
          id: '',
          partialText: partialMessage,
          showStatus: true,
          status: types.Status.sent);
    }
    if (message != null) {
      final messageMap = message.toJson();
      messageMap.removeWhere((key, value) => key == 'id');
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

  @override
  void initState() {
    _isNew = Get.arguments['isNew'] ?? false;
    roomId = Get.arguments['roomId'];
    user = Get.arguments['userData'];
    isTeam = Get.arguments['isTeam'] ?? false;
    room = Get.arguments['room'];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 21.0,
              foregroundImage: CachedNetworkImageProvider(user?['imageUrl'] !=
                      null
                  ? API.imageUrl(user?['imageUrl'])
                  : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?['firstName'] ?? "",
                  style: getBoldItalicStyle(
                    color: ColorManager.goodMorning,
                    fontSize: 16.sp,
                  ),
                ),
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       ImageAssets.iconSpark,
                //       colorFilter: const ColorFilter.mode(
                //           ColorManager.orColor, BlendMode.srcIn),
                //     ),
                //     // const SizedBox(width: 6.0),
                //     // Text(
                //     //   '1,344 xp',
                //     //   style: getRegularStyle(
                //     //     color: ColorManager.goodMorning,
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageAssets.iconCup,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ImageAssets.iconMore,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // StreamBuilder(
          //     stream: FirebaseFirestore.instance
          //         .collection('/Rooms')
          //         .doc(roomId)
          //         .collection('messages')
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: ListView(
          //               // reverse: true,
          //               // itemCount: snapshot.data!.length,
          //               // itemBuilder: (context, index) {
          //               //   final actualIndex = index;
          //               //   final message =
          //               //   // final bool sameAsPreviousSender = actualIndex > 0 &&
          //               //   //     messages[actualIndex - 1].sender ==
          //               //   //         message.sender;

          //               //   return
          //               // },
          //               children: snapshot.data!.docs
          //                   .map((e) => MessageBubble(
          //                         text: e['text'],
          //                         isSender: false,
          //                         // sameAsPreviousSender: sameAsPreviousSender,
          //                         timestamp: DateTime.now(),
          //                       ))
          //                   .toList(),
          //             ),
          //           ),
          //         );
          //       } else if (snapshot.connectionState ==
          //           ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }

          //       return const SizedBox();
          //     }),

          Expanded(
            child: StreamBuilder<List<types.Message>>(
              initialData: const <types.Message>[],
              stream: FirebaseChatCore.instance.messages(
                  room ?? Room(id: roomId, type: RoomType.direct, users: [])),
              builder: (context, snapshot) {
                return SizedBox(
                  width: double.infinity,
                  child: Chat(
                    isAttachmentUploading: _isAttachmentUploading,
                    messages: snapshot.data ?? [],
                    onAttachmentPressed: _handleAtachmentPressed,
                    onMessageTap: _handleMessageTap,
                    showUserAvatars: true,
                    onMessageVisibilityChanged: (p0, visible) {
                      bool theOtherUser = Storage().firebaseUID != p0.author.id;
                      if (visible && theOtherUser) {
                        Map<String, dynamic> jsonMessage = p0.toJson();
                        jsonMessage['status'] = 'seen';
                        final updatedMessage = p0.copyWith(
                          status: types.Status.seen,
                        );
                        jsonMessage.removeWhere(
                          (key, value) =>
                              key == 'author' ||
                              key == 'createdAt' ||
                              key == 'id',
                        );
                        jsonMessage['authorId'] = p0.author.id;
                        jsonMessage['updatedAt'] = FieldValue.serverTimestamp();

                        FirebaseFirestore.instance
                            .collection('Rooms')
                            .doc(roomId)
                            .collection('messages')
                            .doc(p0.id)
                            .update(jsonMessage);
                      }
                    },
                    listBottomWidget: Container(
                      color: Colors.redAccent,
                    ),
                    inputOptions: const InputOptions(
                      sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                    ),
                    theme: DefaultChatTheme(
                        inputMargin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        inputBackgroundColor: ColorManager.white,
                        inputPadding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 6),
                        attachmentButtonIcon: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: const BoxDecoration(
                              color: ColorManager.activeIcon,
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: ColorManager.white,
                          ),
                        ),
                        inputSurfaceTintColor: ColorManager.activeIcon,
                        receivedMessageBodyTextStyle:
                            const TextStyle(color: ColorManager.goodMorning),
                        inputContainerDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xffF7F7F7),
                        attachmentButtonMargin:
                            const EdgeInsets.symmetric(horizontal: 0),
                        inputTextColor: Colors.black,
                        sendButtonMargin: EdgeInsets.zero,
                        sendButtonIcon: Container(
                          width: 38,
                          height: 48,
                          decoration: const BoxDecoration(
                              color: ColorManager.solidPurple,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            ImageAssets.iconSend,
                            height: 15,
                            width: 20,
                            fit: BoxFit.none,
                          ),
                        ),
                        inputTextDecoration: InputDecoration(
                            fillColor: ColorManager.chatBackGround,
                            filled: true,
                            // isCollapsed: true,
                            isDense: true,
                            // enabledBorder: ,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Type Your massage',
                            enabled: true,
                            hintStyle:
                                getBoldStyle(color: const Color(0xff8D96A5)))),
                    l10n: const ChatL10nEn(
                      inputPlaceholder: 'Type Your massage',
                      unreadMessagesLabel: "Unread messages",
                    ),
                    onSendPressed: _handleSendPressed,
                    showUserNames: true,
                    typingIndicatorOptions: const TypingIndicatorOptions(),
                    disableImageGallery: true,
                    bubbleBuilder: _bubbleBuilder,
                    onPreviewDataFetched: _handlePreviewDataFetched,
                    user: types.User(
                      id: Storage().firebaseUID ?? '',
                      imageUrl: Storage().avatar,
                    ),
                  ),
                );
              },
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.all(20.0),
          //   color: ColorManager.white,
          //   child: Row(
          //     children: <Widget>[
          //       Expanded(
          //         child: TextFormField(
          //           controller: _controller,
          //           decoration: InputDecoration(
          //             filled: true,
          //             fillColor: ColorManager.chatBackGround,
          //             hintText: 'Send a message...',
          //             hintStyle: getRegularStyle(
          //                 color: ColorManager.darkGrey, fontSize: 14.sp),
          //             prefixIcon: Padding(
          //               padding: const EdgeInsets.all(12.0),
          //               child: IconButton(
          //                 onPressed: () {},
          //                 icon: Container(
          //                   width: 32,
          //                   height: 32,
          //                   decoration: ShapeDecoration(
          //                     color: ColorManager.orColor,
          //                     shape: const OvalBorder(),
          //                     shadows: [
          //                       BoxShadow(
          //                         color: ColorManager.black.withOpacity(0.1),
          //                         blurRadius: 4,
          //                         offset: const Offset(0, 4),
          //                       )
          //                     ],
          //                   ),
          //                   child: const Icon(
          //                     Icons.add,
          //                     color: Colors.white,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(26.0),
          //                 borderSide: BorderSide.none),
          //           ),
          //         ),
          //       ),
          //       IconButton(
          //         icon: Container(
          //           width: 48,
          //           height: 48,
          //           padding: const EdgeInsets.all(12.0),
          //           decoration: ShapeDecoration(
          //             color: ColorManager.solidPurple,
          //             shape: const OvalBorder(),
          //             shadows: [
          //               BoxShadow(
          //                 color: ColorManager.solidPurple.withOpacity(0.21),
          //                 blurRadius: 16,
          //                 offset: const Offset(0, 8),
          //               )
          //             ],
          //           ),
          //           child: SvgPicture.asset(
          //             ImageAssets.iconSend,
          //           ),
          //         ),
          //         onPressed: () {},
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _bubbleBuilder(
    Widget child, {
    required types.Message message,
    required nextMessageInGroup,
  }) =>
      Bubble(
        color: Storage().firebaseUID != message.author.id ||
                message.type == types.MessageType.image
            ? ColorManager.white
            : ColorManager.solidPurple,
        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null,
        nip: nextMessageInGroup
            ? BubbleNip.no
            : Storage().firebaseUID != message.author.id
                ? BubbleNip.leftBottom
                : BubbleNip.rightBottom,
        child: child,
        style: const BubbleStyle(),
      );

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      _setAttachmentUploading(true);
      final file = File(result.path);
      final size = file.lengthSync();
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final name = result.name;

      UploadTask uploadTask;
      try {
        final reference =
            FirebaseStorage.instance.ref().child('Global').child('/$name');
        uploadTask = reference.putData(await file.readAsBytes());
        final uri = await (await uploadTask).ref.getDownloadURL();

        final message = types.PartialImage(
          height: image.height.toDouble(),
          name: name,
          size: size,
          uri: uri,
          width: image.width.toDouble(),
        );

        sendMessage(message);
        _setAttachmentUploading(false);
      } finally {
        _setAttachmentUploading(false);
      }
    }
  }

  void _setAttachmentUploading(bool uploading) {
    setState(() {
      _isAttachmentUploading = uploading;
    });
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      _setAttachmentUploading(true);
      final name = result.files.single.name;
      final filePath = result.files.single.path!;
      final file = File(filePath);
      UploadTask uploadTask;
      try {
        final reference =
            FirebaseStorage.instance.ref().child('Global').child('/$name');
        uploadTask = reference.putData(await file.readAsBytes());
        final uri = await (await uploadTask).ref.getDownloadURL();

        final message = types.PartialFile(
          mimeType: lookupMimeType(filePath),
          name: name,
          size: result.files.single.size,
          uri: uri,
        );

        sendMessage(message);
        _setAttachmentUploading(false);
      } finally {
        _setAttachmentUploading(false);
      }
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, roomId);
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final updatedMessage = message.copyWith(isLoading: true);
          FirebaseChatCore.instance.updateMessage(
            updatedMessage,
            roomId,
          );

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final updatedMessage = message.copyWith(isLoading: false);
          FirebaseChatCore.instance.updateMessage(updatedMessage, roomId);
        }
      }

      await OpenFilex.open(localPath);
    }
    if (message is types.AudioMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('https')) {
        try {
          final updatedMessage = message.copyWith();
          FirebaseChatCore.instance.updateMessage(
            updatedMessage,
            roomId,
          );

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir${message.name}';
          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
          // await audioPlayer.setReleaseMode(ReleaseMode.loop);
        } finally {
          final updatedMessage = message.copyWith();
          FirebaseChatCore.instance.updateMessage(updatedMessage, roomId);
        }
      }
      // await audioPlayer.setSourceDeviceFile(
      //   localPath,
      // );
      // audioPlayer.play(DeviceFileSource(localPath));
      // await audioPlayer.setSourceDeviceFile(
      //   localPath,
      // );
    }
  }

  void _handleSendPressed(types.PartialText message) {
    sendMessage(message);
    if (room != null) {
      room?.users.forEach((element) {
        sendNotification(element.id ?? '', message.text);
      });
    }
  }

  Future<void> sendNotification(
    String fcmToken,
    String body,
  ) async {
    var data = await Get.find<WebServiceConnections>().postFirebaseRequest(
        useMyPath: true,
        data: {
          "to": fcmToken,
          "notification": {"body": body, "title": Storage().fistName},
        },
        path: 'https://fcm.googleapis.com/fcm/send');
  }
}
