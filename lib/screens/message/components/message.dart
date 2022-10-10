import 'package:chat_messsaging/models/ChatMessage.dart';
import 'package:chat_messsaging/screens/message/components/audio_message.dart';
import 'package:chat_messsaging/screens/message/components/message_status_dot.dart';
import 'package:chat_messsaging/screens/message/components/text_message.dart';
import 'package:chat_messsaging/screens/message/components/video_message.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  Widget messageContaint(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessage(message: message);
      case ChatMessageType.audio:
        return AudioMessage(message: message);
      case ChatMessageType.video:
        return VideoMessage(message: message);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isSender) ...{
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/img/user_2.png"),
            ),
            const SizedBox(width: defaultPadding / 4)
          },
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}
