import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screens/signin_signup/signup_screen.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:chat_messsaging/shared/styles/text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Sign In",
                  style: TextStyle(
                    fontSize: 24,
                    color: primrayColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: primrayColor,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      email: val;
                    });
                  },
                  validator: (value) {
                    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)
                      ? null
                      : "Please enter a valid email!";
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: inputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: primrayColor,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      password: val;
                    });
                  },
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Please must be at lease 6 character!";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print(email);
                        print(password);
                      }
                    },
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
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register here",
                        style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          HelperFunction.gotoScreen(context, const SignUpScreen());
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