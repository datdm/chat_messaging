import 'package:chat_messsaging/components/primary_button.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import "package:flutter/material.dart";

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding,),
          child: Column(
            children: [
              Spacer(flex: 3),
              Image.asset("assets/img/logo_light.png", height: 146),
              Spacer(),
              PrimaryButton(
                text: "Sign In",
                onPress: () {}
              ),
              SizedBox(
                height: defaultPadding * 1.5
              ),
              PrimaryButton(
                text: "Sign Up",
                onPress: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              Spacer(flex: 3)
            ],
          ),
        )
      )
    );
  }
}