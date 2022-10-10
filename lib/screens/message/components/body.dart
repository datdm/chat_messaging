import 'package:flutter/material.dart';
import 'package:chat_messsaging/models/ChatMessage.dart';
import 'package:chat_messsaging/screens/message/components/message.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:chat_messsaging/screens/message/components/chat_input_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index]
              )
            ),
          )
        ),
        const ChatInputField()
      ],
    );
  }
}


