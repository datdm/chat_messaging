import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screen/chats/chats_screen.dart';
import 'package:chat_messsaging/screen/signin_signup/signin_signup.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
    required this.isSignedIn
  }) : super(key: key);

  final bool isSignedIn;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("assets/img/welcome_image.png"),
            const Spacer(flex: 3),
            const Text(
              "Welcome to out freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )
            ),
            const Spacer(),
            Text(
              "Freedom take any person of your \nmother language",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              child: TextButton(
                onPressed: () {
                  HelperFunction.gotoScreen(context, widget.isSignedIn ? const ChatsScreen() : const SignInSignUp());
                },
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(
                          color: Theme
                          .of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.8)
                        ),
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8),
                    )
                ],)
              ),
            )
          ]
        )
      ),
    );
  }
}