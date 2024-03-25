import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/routes/app_routes.dart';
import 'package:global_online/core/widgets/custom_text_field_widget.dart';
import 'package:global_online/module/chat/data/models/all_contact_model.dart';
import 'package:global_online/module/chat/view/chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key}) {
    firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      firebaseUser = user;
    });
  }
  late User? firebaseUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFieldWidget(
              hint: 'search here',
              colorFilled: ColorManager.lightGrey.withOpacity(0.2),
              prefix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  ImageAssets.iconSearch,
                  width: 14.w,
                  height: 14.h,
                ),
              ),
              hintStyle: getRegularStyle(
                  color: ColorManager.darkGrey, fontSize: 14.sp),
            ),
            SizedBox(height: 26.h),
            StreamBuilder(
                // stream: FirebaseChatCore.instance.rooms(),
                stream: FirebaseFirestore.instance
                    .collection('Rooms')
                    .where('userIds', arrayContains: firebaseUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return ChatItem(
                            snapshot: snapshot.data!.docs[index],
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatefulWidget {
  final QueryDocumentSnapshot snapshot;
  const ChatItem({
    super.key,
    required this.snapshot,
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  late int unread;
  late Map<String, dynamic> latestMessage;
  late bool notSeen;
  late Map<String, dynamic> userData;
  @override
  void initState() {
    unread = 0;
    latestMessage = {};
    notSeen = false;

    userData = {};
    getUsers();
    getLatestMessage(widget.snapshot);
    super.initState();
  }

  getLatestMessage(QueryDocumentSnapshot snapshot) async {
    final QuerySnapshot<Map<String, dynamic>> messageList =
        await FirebaseChatCore.instance
            .getFirebaseFirestore()
            .collection(FirebaseChatCore.instance.config.roomsCollectionName)
            .doc(snapshot.id)
            .collection("messages")
            .orderBy("createdAt", descending: true)
            .get();

    if (messageList.docs.isNotEmpty) {
      latestMessage = messageList.docs.first.data();
      notSeen = (latestMessage['authorId'] !=
              FirebaseAuth.instance.currentUser!.uid &&
          latestMessage['status'] != 'seen');
    }

    for (var element in messageList.docs) {
      if (element.data()['status'] != 'seen' &&
          element.data()['authorId'] !=
              FirebaseAuth.instance.currentUser!.uid) {
        unread++;
      }
    }
    setState(() {});
  }

  getUsers() async {
    if (widget.snapshot['type'] == 'group') {
      userData['firstName'] = widget.snapshot['name'];
    } else {
      List<dynamic> userIds = widget.snapshot['userIds'];

      String userId = userIds[0] == FirebaseAuth.instance.currentUser!.uid
          ? userIds[1]
          : userIds[0];

      // Reference to the users collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');

      // Get the document snapshot for the user with the provided ID
      DocumentSnapshot userDataDocument = await users.doc(userId).get();

      // Check if the document exists
      if (userDataDocument.exists) {
        // Return the user data
        setState(() {
          userData = (userDataDocument.data() as Map<String, dynamic>);
        });
        if (kDebugMode) {
          print(userDataDocument.data() as Map<String, dynamic>);
        }
      } else {
        // Document does not exist
        if (kDebugMode) {
          print('User with ID $userId does not exist.');
        }
        // return null;
      }
    }

    // AggregateQuery usersData = await FirebaseFirestore.instance
    //     .collection('Rooms')
    //     .where('userIds', arrayContains: FirebaseAuth.instance.currentUser!.uid)
    //     .count();

    // print(usersData.query.parameters);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print(widget.snapshot.data());
        Map<String, dynamic> data =
            widget.snapshot.data() as Map<String, dynamic>;
        data['createdAt'] = Timestamp.fromDate(
                (widget.snapshot['createdAt'] as Timestamp).toDate())
            .seconds;
        data['updatedAt'] = Timestamp.fromDate(
                (widget.snapshot['updatedAt'] as Timestamp).toDate())
            .seconds;

        data['users'] =
            data['userIds'].map((e) => types.User(id: e).toJson()).toList();

        data['id'] = widget.snapshot.id;
        userData['imageUrl'] = widget.snapshot['imageUrl'];
        Get.toNamed(AppRoutes.chat, arguments: {
          'roomId': widget.snapshot.id,
          'userData': userData,
          "room": types.Room.fromJson(data),
        });
      },
      leading: CircleAvatar(
        radius: 21.0,
        foregroundImage: CachedNetworkImageProvider(widget
                    .snapshot['imageUrl'] !=
                null
            ? API.imageUrl(widget.snapshot['imageUrl'])
            : 'https://cdn.logojoy.com/wp-content/uploads/2018/05/30161703/251.png'),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userData['firstName'] ?? '-',
            style: getBoldItalicStyle(
                color: ColorManager.blackText, fontSize: FontSize.s16.sp),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          latestMessage['type'] == 'text'
              ? Text(
                  latestMessage.isNotEmpty ? latestMessage['text'] : '',
                  style: notSeen
                      ? getBoldStyle(color: ColorManager.blackText)
                      : getRegularStyle(
                          color: ColorManager.blackText,
                          fontSize: FontSize.s12.sp),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                )
              : latestMessage['type'] == 'image'
                  ? SizedBox(
                      height: 10,
                      width: 10,
                      child: Image.network(latestMessage['uri']),
                    )
                  : Icon(
                      Icons.file_copy,
                      size: 10,
                    ),
        ],
      ),
      trailing: unread > 0
          ? Container(
              height: 20.0,
              width: 20.0,
              decoration: const BoxDecoration(
                color: ColorManager.harlequin,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$unread',
                  style: getBoldStyle(
                    color: ColorManager.white,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
