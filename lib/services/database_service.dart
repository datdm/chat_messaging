import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({ this.uid });

  final FirebaseFirestore instanceFirestore = FirebaseFirestore.instance;

  late CollectionReference userCollection = instanceFirestore.collection("users");
  late CollectionReference groupsCollection = instanceFirestore.collection("groups");

  late DocumentReference doc = userCollection.doc(uid);

  Future savingUserData(String email, String fullname) async {
    return await userCollection.doc(uid).set({
      "uid": uid,
      "email": email,
      "fullname": fullname,
      "groups": [],
      "profilePic": "",
    });
  }

  Future gettingUserData(String email) async {
    Query query = userCollection.where("email", isEqualTo: email);
    QuerySnapshot snapshot = await query.get();
    return snapshot;
  }
}
