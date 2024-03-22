import 'dart:developer';

import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

import '../../../core/utils/services/storage.dart';

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

  void sendMessage(dynamic partialMessage, bool? isPin) async {
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
          remoteId: isPin != null ? 'Pin' : '',
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
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    print(user);
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
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.iconSpark,
                      colorFilter: const ColorFilter.mode(
                          ColorManager.orColor, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      '1,344 xp',
                      style: getRegularStyle(
                        color: ColorManager.goodMorning,
                      ),
                    ),
                  ],
                ),
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
              stream: FirebaseChatCore.instance
                  .messages(Room(id: roomId, type: RoomType.direct, users: [])),
              builder: (context, snapshot) {
                return SizedBox(
                  width: double.infinity,
                  child: Chat(
                    // audioMessageBuilder: (p0, {messageWidth}) {
                    //   return Lottie.network('${p0}',
                    //       animate: true, delegates: LottieDelegates());
                    // },

                    // isAttachmentUploading: _isAttachmentUploading,
                    messages: snapshot.data ?? [],
                    // onAttachmentPressed: _handleAtachmentPressed,
                    // onMessageTap: _handleMessageTap,

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
                        FirebaseChatCore.instance
                            .updateMessage(updatedMessage, roomId);

                        FirebaseFirestore.instance
                            .collection('Rooms')
                            .doc(roomId)
                            .collection('messages')
                            .doc(p0.id)
                            .update(jsonMessage);
                      }
                    },

                    // listBottomWidget: Container(
                    //   color: Colors.redAccent,
                    // ),
                    // customBottomWidget: Container(
                    //     // color: Colors.red,
                    //     // height: 20,
                    //     ),
                    theme: DefaultChatTheme(
                        // attachmentButtonIcon: recorder.isRecording
                        //     ? StreamBuilder<RecordingDisposition>(
                        //         stream: recorder.onProgress,
                        //         builder: (context, snapshot) {
                        //           final duration = snapshot.hasData
                        //               ? snapshot.data!.duration
                        //               : Duration.zero;
                        //           String towDidits(int n) =>
                        //               n.toString().padLeft(0);
                        //           final towDiditsMinutes =
                        //               towDidits(duration.inMinutes.remainder(60));
                        //           final towDiditsSecond =
                        //               towDidits(duration.inSeconds.remainder(60));
                        //           durationAudio = snapshot.data!.duration;
                        //           if (duration.inMinutes == 1) {
                        //             stop();
                        //             setState(() {});
                        //             durationAudio = snapshot.data!.duration;
                        //           }

                        //           return Text(
                        //             '$towDiditsMinutes:$towDiditsSecond',
                        //             style: TextStyle(
                        //               fontSize: 12.sp,
                        //               color: ColorManager.mainColor,
                        //             ),
                        //           );
                        //         },
                        //       )
                        //     :
                        //     Container(
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //             gradient: LinearGradient(
                        //               colors: widget.color == null
                        //                   ? [
                        //                       ColorManager.mainColor,
                        //                       ColorManager.gradiantSplash
                        //                     ]
                        //                   : widget.color!
                        //                       .split(',')
                        //                       .map((e) => HexColor.fromHex(e))
                        //                       .toList(),
                        //               tileMode: TileMode.decal,
                        //               begin: Alignment.centerLeft,
                        //               end: Alignment.centerRight,
                        //             ),
                        //             shape: BoxShape.circle),
                        //         child: Icon(
                        //           Icons.add,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        receivedMessageBodyTextStyle:
                            const TextStyle(color: ColorManager.goodMorning),
                        inputContainerDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color(0xffF7F7F7),
                        // attachmentButtonMargin: EdgeInsets.zero,
                        inputTextColor: Colors.black,
                        sendButtonMargin: EdgeInsets.zero,
                        sendButtonIcon: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: ColorManager.solidPurple,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            ImageAssets.iconSend,
                            height: 20,
                            width: 20,
                            fit: BoxFit.none,
                          ),
                        ),
                        inputTextDecoration: InputDecoration(
                            hintText: 'Type Your massage',
                            enabled: true,
                            hintStyle:
                                getBoldStyle(color: const Color(0xff8D96A5)))),
                    l10n: const ChatL10nEn(
                      inputPlaceholder: 'Type Your massage',
                      unreadMessagesLabel: "Unread messages",
                    ),

                    // customBottomWidget: InputCustomWidget(
                    //     customWidget: IconButton(
                    //       constraints: const BoxConstraints(
                    //         minHeight: 24,
                    //         minWidth: 24,
                    //       ),
                    //       icon: Icon(
                    //         recorder.isRecording ? Icons.stop : Icons.mic,
                    //         color: widget.color != null
                    //             ? widget.color!
                    //                 .split(',')
                    //                 .map((e) => HexColor.fromHex(e))
                    //                 .toList()
                    //                 .first
                    //             : ColorManager.mainColor,
                    //       ),
                    //       onPressed: () async {
                    //         if (recorder.isRecording) {
                    //           await stop();
                    //         } else {
                    //           await initRecorder();
                    //         }
                    //         setState(() {});
                    //       },
                    //       splashRadius: 24,
                    //     ),
                    //     options: InputOptions(
                    //         enableSuggestions: true,
                    //         sendButtonVisibilityMode:
                    //             SendButtonVisibilityMode.editing),
                    //     onSendPressed: _handleSendPressed,
                    //     onAttachmentPressed: _handleAtachmentPressed),
                    showUserNames: true,
                    typingIndicatorOptions: const TypingIndicatorOptions(),
                    // disableImageGallery: true,
                    bubbleBuilder: _bubbleBuilder,
                    // onPreviewDataFetched: _handlePreviewDataFetched,
                    onSendPressed: (partial) => sendMessage(partial, false),
                    // audioMessageBuilder: (p0, {required messageWidth}) {
                    // var audioPlayer = AudioPlayer();
                    // return Message(emojiEnlargementBehavior: EmojiEnlargementBehavior.single,
                    //   hideBackgroundOnEmojiMessages: true, message: AudioMessage(author: p0.author, duration: p0.duration, id: p0.id, name: p0.name, size: p0.size, uri:p0.uri), messageWidth: messageWidth, roundBorder: null, showAvatar: null, showName: null, showStatus: null, showUserAvatars: null, textMessageOptions: null, usePreviewData: null,);

                    // return audioWidget(
                    //   p0: p0,
                    // );
                    // Lottie.asset(
                    //   'ssss',
                    // );
                    // },

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
}
