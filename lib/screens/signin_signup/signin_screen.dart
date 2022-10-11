import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screens/chats/chats_screen.dart';
import 'package:chat_messsaging/screens/signin_signup/signup_screen.dart';
import 'package:chat_messsaging/services/auth_service.dart';
import 'package:chat_messsaging/services/database_service.dart';
import 'package:chat_messsaging/shared/constants/constants.dart';
import 'package:chat_messsaging/shared/styles/text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();

  bool _isLoading = false;
  String email = "admin@gmail.com";
  String password = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _isLoading
          ? const Center(
            child: CircularProgressIndicator(
              color: primrayColor,
            ),
          )
          : Padding(
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
                    initialValue: email,
                    onChanged: (val) {
                      setState(() {
                        email = val;
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
                    initialValue: password,
                    onChanged: (val) {
                      setState(() {
                        password = val;
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
                        signin();
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

  signin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await auth
        .signinUserWithEmailAndPassword(email, password)
        .then((value) async {
          if (value == true) {
            QuerySnapshot snapshot = await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);
            await HelperFunction.saveUserLoggedInStatus(true);
            await HelperFunction.saveUserEmail(email);
            await HelperFunction.saveUserName(snapshot.docs[0]["fullname"]);

            HelperFunction.gotoNewScreen(context, const ChatsScreen());
          } else {
            setState(() {
              _isLoading = false;
            });
          }
        });
    }
  }
}