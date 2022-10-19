import 'package:chat_messsaging/components/fill_outline_button.dart';
import 'package:chat_messsaging/models/Chat.dart';
import 'package:chat_messsaging/screens/chats/components/chat_card.dart';
import 'package:chat_messsaging/screens/message/message_screen.dart';
import 'package:chat_messsaging/services/database_service.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Stream? users;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
      .getUsers()
      .then((snapshot) {
        setState(() {
          users = snapshot;
        });
      });
  }

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
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: dataChats.length,
        //     itemBuilder: (BuildContext contenxt, int index) => ChatCard(
        //       chat: dataChats[index],
        //       onPress: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (_) => const MessageScreen()));
        //       },
        //     ),
        //   )
        // )
        Expanded(
          child: StreamBuilder(
            stream: users,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['groups'] != null) {
                  if (snapshot.data['groups'].length != 0) {
                    return const Center(child: Text("Has Data"));
                  } else {
                    return noDataWidget();
                  }
                } else {
                  return noDataWidget();
                }
              } else {
                return noDataWidget();
              }
            },
          ),
        )
      ],
    );
  }

  noDataWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Create groups"),
                    content: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: primrayColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: primrayColor)
                        )
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: primrayColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                          )
                        ),
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: primrayColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                          )
                        ),
                        child: const Text("Create"),
                      )
                    ],
                  );
                }
              );
            },
            child: const Icon(
              Icons.add_circle, 
              color: primrayColor,
              size: 75
            ),
          ),
          const SizedBox(height: 20),
          const Text("You haven't a message!")
        ],
      )
    );
  }
}
