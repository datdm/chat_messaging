import 'package:chat_messsaging/components/primary_button.dart';
import 'package:chat_messsaging/screen/chats/chats_screen.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import "package:flutter/material.dart";

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding,),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Image.asset("assets/img/logo_light.png", height: 146),
              const Spacer(),
              PrimaryButton(
                text: "Sign In",
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatsScreen()));
                }
              ),
              const SizedBox(
                height: defaultPadding * 1.5
              ),
              PrimaryButton(
                text: "Sign Up",
                onPress: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(flex: 3)
            ],
          ),
        )
      )
    );
  }
}