import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/models/MyChartProxyProvider.dart';
import 'package:chat_messsaging/screens/welcome/welcome_screen.dart';
import 'package:chat_messsaging/shared/constants/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) => {
      if (value != null) {
        setState(() {
          isSignedIn = value;
        })
      }
    });
  }

  // Future<MyChartFutureProvider> someGetFuture() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return MyChartFutureProvider(chart: "3");
  // }

  // Stream<MyChartStreamProvider> someGetFuture() {
  //   return Stream<MyChartStreamProvider>.periodic(
  //     const Duration(seconds: 1),
  //     (x) => MyChartStreamProvider(chart: "$x")
  //   ).take(10);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyChartProxyProvider1>(create: (context) => MyChartProxyProvider1()),
        ProxyProvider<MyChartProxyProvider1, MyChartProxyProvider2>(update: (context, myModel1, myModel2) => MyChartProxyProvider2(myModel1: myModel1)),
      ],
      child: MaterialApp(
        title: 'Chat Messaging',
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(isSignedIn: isSignedIn),
      ),
    );
  }
}
