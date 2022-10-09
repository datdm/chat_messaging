import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/screen/welcome/welcome_screen.dart';
import 'package:chat_messsaging/shared/constants/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: FirebaseConstants.apiKey,
        appId: FirebaseConstants.appId,
        messagingSenderId: FirebaseConstants.messagingSenderId,
        projectId: FirebaseConstants.projectId,
      )
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) => {
      if (value != null) {
        _isSignedIn = value
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Messaging',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(isSignedIn: _isSignedIn),
    );
  }
}
