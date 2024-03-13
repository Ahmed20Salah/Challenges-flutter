import 'package:flutter/material.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/module/chat/data/models/message_model.dart';
import 'package:global_online/module/chat/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

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

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(MessageModel(
          text: _controller.text,
          sender: "Bob",
          isSender: true,
          timestamp: DateTime.now(),
        ));
        _controller.clear();
      });
    }
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final actualIndex = messages.length - 1 - index;
                  final message = messages[actualIndex];
                  final bool sameAsPreviousSender = actualIndex > 0 &&
                      messages[actualIndex - 1].sender == message.sender;

                  return MessageBubble(
                    text: message.text,
                    isSender: message.isSender,
                    sameAsPreviousSender: sameAsPreviousSender,
                    timestamp: message.timestamp,
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: ColorManager.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorManager.chatBackGround,
                      hintText: 'Send a message...',
                      hintStyle: getRegularStyle(
                          color: ColorManager.darkGrey, fontSize: 14.sp),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: ColorManager.orColor,
                              shape: const OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: ColorManager.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(
                  icon: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12.0),
                    decoration: ShapeDecoration(
                      color: ColorManager.solidPurple,
                      shape: const OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: ColorManager.solidPurple.withOpacity(0.21),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      ImageAssets.iconSend,
                    ),
                  ),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
