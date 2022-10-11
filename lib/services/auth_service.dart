import 'package:chat_messsaging/helper/helper_function.dart';
import 'package:chat_messsaging/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // sign in
  Future signinUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      User user = userCredential.user!;
      if (user.email != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // sign up
  Future signupUserWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user!.email != null) {
        DatabaseService(uid: user.uid).savingUserData(email, name);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // sign out
  Future signOut() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmail("");
      await HelperFunction.saveUserName("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}