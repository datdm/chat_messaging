import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primrayColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 18.0,
            width: 18.0,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_left),
            ),
          ),
          const SizedBox(width: 20),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/img/user_2.png"),
            radius: 14,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Kristin Watson',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Online',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_phone)
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.videocam)
        )
      ],
    );
  }
}