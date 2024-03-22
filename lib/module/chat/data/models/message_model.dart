class MessageModel {
  final String text;
  final String sender;
  final bool isSender;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.sender,
    required this.isSender,
    required this.timestamp,
  });
}
