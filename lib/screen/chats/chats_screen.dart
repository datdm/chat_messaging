import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primrayColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primrayColor,
      elevation: 0,
      title: const Text("Chats"),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search)
        )
      ],
    );
  }
}