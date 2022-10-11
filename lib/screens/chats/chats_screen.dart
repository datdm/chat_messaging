import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screens/signin_signup/signin_signup.dart';
import 'package:chat_messsaging/services/auth_service.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // state
  int _selectedIndex = 0;
  String name = "";

  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunction.getUserName().then((value) {
      setState(() {
        name = value!;
      });
    });
  }

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
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
          children: [
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(
              height: 15,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
              leading: const Icon(Icons.logout_outlined),
              selectedColor: primrayColor,
              selected: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.exit_to_app)
                        ),
                        IconButton(
                          onPressed: () {
                            auth.signOut();
                            HelperFunction.gotoNewScreen(context, const SignInSignUp());
                          },
                          icon: const Icon(Icons.done)
                        ),
                      ],
                    );
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      // fixedColor: primrayColor,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      backgroundColor: Colors.white,
      selectedItemColor: contentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: primrayColor),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: "Chats",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "People",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Call"
        ),
        BottomNavigationBarItem(
          icon: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/user_2.png'),
            radius: 14,
          ),
          label: name,
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primrayColor,
      elevation: 0,
      title: const Text("Chats"),
      // automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search)
        )
      ],
    );
  }
}