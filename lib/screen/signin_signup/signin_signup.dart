import "package:flutter/material.dart";

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/img/logo_light.png", height: 146),
            // PrimaryButton(text: "Sign In", onPress: () {})
          ],
        )
      )
    );
  }
}