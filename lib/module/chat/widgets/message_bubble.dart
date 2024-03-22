import 'package:flutter/material.dart';
import 'package:global_online/core/resources/resource.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool sameAsPreviousSender;
  final DateTime timestamp;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.isSender,
    this.sameAsPreviousSender = false,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top: sameAsPreviousSender ? 0.0 : 12.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment:
        isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!isSender)
            const CircleAvatar(
              radius: 21.0,
              foregroundImage: AssetImage(ImageAssets.profile),
            ),
          const SizedBox(width: 12.0),
          Flexible(
            child: Container(
              // margin: const EdgeInsets.all(10),
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: isSender ? ColorManager.solidPurple : ColorManager.white,
                borderRadius: _getBorderRadius(isSender, sameAsPreviousSender),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: isSender ? Colors.white : Colors.black),
                    maxLines: null,
                    // overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    _timeAgoSinceDate(timestamp, numericDates: false),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius _getBorderRadius(
      bool isSender,
      bool sameAsPreviousSender,
      ) {
    if (sameAsPreviousSender) {
      // Two rounded corners on the sender's side
      return BorderRadius.only(
        topLeft: Radius.circular(isSender ? 20.0 : 0.0),
        topRight: Radius.circular(isSender ? 0.0 : 20.0),
        bottomLeft: Radius.circular(isSender ? 20.0 : 0.0),
        bottomRight: Radius.circular(isSender ? 0.0 : 20.0),
      );
    } else {
      // Three rounded corners, with bottom matching sender
      return BorderRadius.only(
        topLeft: const Radius.circular(20.0),
        topRight: const Radius.circular(20.0),
        bottomLeft: Radius.circular(isSender ? 20.0 : 0.0),
        bottomRight: Radius.circular(isSender ? 0.0 : 20.0),
      );
    }
  }

  String _timeAgoSinceDate(DateTime dateTime, {bool numericDates = true}) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 8) {
      return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
    } else if ((difference.inDays / 7).floor() >= 1) {
      final weekCount = (difference.inDays / 7).floor();
      return numericDates
          ? '$weekCount week${weekCount > 1 ? "s" : ""} ago'
          : 'Last week';
    } else if (difference.inDays >= 2) {
      return numericDates ? '${difference.inDays} days ago' : 'A few days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
