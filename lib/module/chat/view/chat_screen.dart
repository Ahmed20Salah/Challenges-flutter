import 'dart:developer';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/chat/data/models/message_model.dart';
import 'package:global_online/module/chat/widgets/message_bubble.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import '../../../core/utils/services/storage.dart';

// import 'flutter';

class ChatScreen extends StatefulWidget {
  final Room? room;
  final String roomId;
  const ChatScreen({super.key, this.room, required this.roomId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<MessageModel> messages = [
    MessageModel(
      text: "Hello, how are you?",
      sender: "Alice",
      isSender: false,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
    MessageModel(
      text: "I'm fine, thank you!",
      sender: "Bob",
      isSender: true,
      timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 5)),
    ),
    MessageModel(
      text: "Glad to hear that. What's new?",
      sender: "Alice",
      isSender: false,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    MessageModel(
      text:
          "Not much, just working on Flutter projects. Not much, just working on Flutter projects. Not much, just working on Flutter projects.",
      sender: "Bob",
      isSender: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    MessageModel(
      text: "That's awesome!",
      sender: "Bob",
      isSender: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    MessageModel(
      text: "That's awesome!",
      sender: "Bob",
      isSender: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    MessageModel(
      text: "That's awesome!",
      sender: "Bob",
      isSender: true,
      timestamp: DateTime.now(),
    ),
    // Add more messages as needed
  ];

  void _sendMessage(PartialText partialText) async {
    if (_controller.text.isNotEmpty) {
      if (FirebaseAuth.instance.currentUser == null) return;
      types.Message? message;

      types.PartialText partialMessage =
          types.PartialText(text: _controller.text);
      message = types.TextMessage.fromPartial(
          author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
          id: '',
          partialText: partialMessage,
          showStatus: true,
          status: types.Status.sent);

      // message = Message.fromJson({
      //   'author':
      //       types.User(id: FirebaseAuth.instance.currentUser!.uid).toJson(),
      //   'id': '',
      //   'showStatus': true,
      //   'type': 'text',
      //   'status': 'sent'
      // });
      // } else if (partialMessage is types.PartialFile) {
      //   message = types.FileMessage.fromPartial(
      //       author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
      //       id: '',
      //       partialFile: partialMessage,
      //       showStatus: true,
      //       status: types.Status.sent);
      // } else if (partialMessage is types.PartialImage) {
      //   message = types.ImageMessage.fromPartial(
      //       author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
      //       id: '',
      //       remoteId: isPin != null ? 'Pin' : '',
      //       partialImage: partialMessage,
      //       showStatus: true,
      //       status: types.Status.sent);
      // } else if (partialMessage is types.PartialText) {
      //   message = types.TextMessage.fromPartial(
      //       author: types.User(id: FirebaseAuth.instance.currentUser!.uid),
      //       id: '',
      //       partialText: partialMessage,
      //       showStatus: true,
      //       status: types.Status.sent);
      // }
      print('room Collection' +
          FirebaseChatCore.instance.config.roomsCollectionName);
      // print(roomId);
      if (message != null) {
        final messageMap = message.toJson();
        messageMap.removeWhere((key, value) => key == 'author' || key == 'id');
        messageMap['authorId'] = FirebaseAuth.instance.currentUser!.uid;
        messageMap['createdAt'] = FieldValue.serverTimestamp();
        messageMap['updatedAt'] = FieldValue.serverTimestamp();
        await FirebaseChatCore.instance
            .getFirebaseFirestore()
            .collection(
                '${FirebaseChatCore.instance.config.roomsCollectionName}/${widget.roomId}/messages')
            .add(messageMap);

        // await FirebaseChatCore.instance
        //     .getFirebaseFirestore()
        //     .collection(FirebaseChatCore.instance.config.roomsCollectionName)
        //     .doc(roomId)
        //     .update({'updatedAt': FieldValue.serverTimestamp()});
      }
    }
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

  @override
  void initState() {
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
            const CircleAvatar(
              radius: 21.0,
              foregroundImage: AssetImage(ImageAssets.profile),
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inter Rafah ⚽️',
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
          //         .doc(widget.roomId)
          //         .collection('messages')
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(16.0),
          //             child: ListView(
          //               reverse: true,
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
          //                         isSender:  true,
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
          StreamBuilder<List<types.Message>>(
            initialData: const <types.Message>[],
            stream: FirebaseChatCore.instance.messages(
                Room(id: widget.roomId, type: RoomType.direct, users: [])),
            builder: (context, snapshot) {
              return SizedBox(
                height: 500,
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
                    log('author ${visible.toString()}');
                    log('author ${p0.author.id.toString()}');
                    log('firebaseUID ${Storage().firebaseUID.toString()}');
                    if (!visible) {
                      final updatedMessage = p0.copyWith(
                          author: p0.author,
                          id: p0.id,
                          showStatus: true,
                          status: types.Status.seen);
                      FirebaseChatCore.instance
                          .updateMessage(updatedMessage, widget.roomId);
                    }
                  },

                  // listBottomWidget: Container(
                  //   color: Colors.redAccent,
                  // ),
                  // customBottomWidget: Container(
                  //     // color: Colors.red,
                  //     // height: 20,
                  //     ),
                  // theme: DefaultChatTheme(
                  //     attachmentButtonIcon: recorder.isRecording
                  //         ? StreamBuilder<RecordingDisposition>(
                  //             stream: recorder.onProgress,
                  //             builder: (context, snapshot) {
                  //               final duration = snapshot.hasData
                  //                   ? snapshot.data!.duration
                  //                   : Duration.zero;
                  //               String towDidits(int n) =>
                  //                   n.toString().padLeft(0);
                  //               final towDiditsMinutes =
                  //                   towDidits(duration.inMinutes.remainder(60));
                  //               final towDiditsSecond =
                  //                   towDidits(duration.inSeconds.remainder(60));
                  //               durationAudio = snapshot.data!.duration;
                  //               if (duration.inMinutes == 1) {
                  //                 stop();
                  //                 setState(() {});
                  //                 durationAudio = snapshot.data!.duration;
                  //               }

                  //               return Text(
                  //                 '$towDiditsMinutes:$towDiditsSecond',
                  //                 style: TextStyle(
                  //                   fontSize: 12.sp,
                  //                   color: ColorManager.mainColor,
                  //                 ),
                  //               );
                  //             },
                  //           )
                  //         : Container(
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //                 gradient: LinearGradient(
                  //                   colors: widget.color == null
                  //                       ? [
                  //                           ColorManager.mainColor,
                  //                           ColorManager.gradiantSplash
                  //                         ]
                  //                       : widget.color!
                  //                           .split(',')
                  //                           .map((e) => HexColor.fromHex(e))
                  //                           .toList(),
                  //                   tileMode: TileMode.decal,
                  //                   begin: Alignment.centerLeft,
                  //                   end: Alignment.centerRight,
                  //                 ),
                  //                 shape: BoxShape.circle),
                  //             child: Icon(
                  //               Icons.add,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //     inputContainerDecoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     backgroundColor: Color(0xffF7F7F7),
                  //     // attachmentButtonMargin: EdgeInsets.zero,
                  //     inputTextColor: Colors.black,
                  //     sendButtonMargin: EdgeInsets.zero,
                  //     sendButtonIcon: SvgPicture.asset(ImageAssets.sendButton),
                  //     inputTextDecoration: InputDecoration(
                  //         hintText: 'Type Your massage',
                  //         enabled: true,
                  //         hintStyle: getBoldStyle(color: Color(0xff8D96A5)))),
                  // l10n: ChatL10nEn(
                  //   inputPlaceholder: 'Type Your massage',
                  //   unreadMessagesLabel: "Unread messages",
                  // ),

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
                  typingIndicatorOptions: TypingIndicatorOptions(),
                  // disableImageGallery: true,
                  bubbleBuilder: _bubbleBuilder,
                  // onPreviewDataFetched: _handlePreviewDataFetched,
                  onSendPressed: (partial) =>
                      sendMessage(partial, widget.roomId, false),
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
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  ),
                ),
              );
            },
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
            ? const Color(0xfff5f5f7)
            : ColorManager.mainColor,
        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null,
        nip: nextMessageInGroup
            ? BubbleNip.no
            : Storage().firebaseUID != message.author.id
                ? BubbleNip.leftBottom
                : BubbleNip.rightBottom,
        child: child,
      );
}
