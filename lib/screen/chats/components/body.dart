import 'package:chat_messsaging/components/fill_outline_button.dart';
import 'package:chat_messsaging/models/chat.dart';
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
            itemBuilder: (BuildContext contenxt, int index) => ChatCard(chat: dataChats[index]),
          )
        )
      ],
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75, horizontal: defaultPadding),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(chat.image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )
                  ),
                  const SizedBox(height: 6),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ),
          Opacity(
            opacity: 0.6,
            child: Text(chat.time)
          )
        ]
      ),
    );
  }
}