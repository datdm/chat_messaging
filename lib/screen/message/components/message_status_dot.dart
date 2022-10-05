import 'package:chat_messsaging/models/ChatMessage.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({
    Key? key,
    required this.status,
  }) : super(key: key);

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return errorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return primrayColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: defaultPadding / 4, bottom: defaultPadding / 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}