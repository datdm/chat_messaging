import 'package:chat_messsaging/components/primary_button.dart';
import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screens/signin_signup/signin_screen.dart';
import 'package:chat_messsaging/screens/signin_signup/signup_screen.dart';
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
                  HelperFunction.gotoScreen(context, const SignInScreen());
                }
              ),
              const SizedBox(
                height: defaultPadding * 1.5
              ),
              PrimaryButton(
                text: "Sign Up",
                onPress: () {
                  HelperFunction.gotoScreen(context, const SignUpScreen());
                },
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