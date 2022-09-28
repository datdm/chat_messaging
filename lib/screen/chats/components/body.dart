import 'package:chat_messsaging/components/fill_outline_button.dart';
import 'package:chat_messsaging/models/Chat.dart';
import 'package:chat_messsaging/screen/chats/components/chat_card.dart';
import 'package:chat_messsaging/screen/message/message_screen.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
