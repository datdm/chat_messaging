import 'package:chat_messsaging/components/fill_outline_button.dart';
import 'package:chat_messsaging/models/Chat.dart';
import 'package:chat_messsaging/screens/chats/components/chat_card.dart';
import 'package:chat_messsaging/screens/message/message_screen.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, defaultPadding * 0.5),
          color: primrayColor,
          child: Row(
            children: [
              FillOutlineButton(text: "Recent Message", onPress: () {}),
              const SizedBox(width: defaultPadding / 2),
              FillOutlineButton(text: "Active", onPress: () {}, isFilled: false)
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dataChats.length,
            itemBuilder: (BuildContext contenxt, int index) => ChatCard(
              chat: dataChats[index],
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MessageScreen()));
              },
            ),
          )
        )
      ],
    );
  }
}
