import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signupUserWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user!.email != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}