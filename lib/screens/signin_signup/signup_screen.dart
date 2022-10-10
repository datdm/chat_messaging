import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screens/signin_signup/signin_screen.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:chat_messsaging/shared/styles/text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final String name = "";
  final String email = "";
  final String password = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding / 2,
            vertical: defaultPadding * 2,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    color: primrayColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    labelText: "Full name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      name: val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      email: val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: inputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      password: val;
                    });
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: primrayColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Colors.white,
                        )
                      )
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Login now",
                        style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          HelperFunction.gotoScreen(context, const SignInScreen());
                        }
                      )
                    ]
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}