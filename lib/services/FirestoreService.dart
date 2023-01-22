
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class FirestoreService {
  final User? user;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  FirestoreService({required this.user});

  Future<SavedUser> getUserFromFirestore()  async {
    SavedUser savedUser = SavedUser();

    DocumentSnapshot snapshot = await usersRef.doc(user?.uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    savedUser.SetUser(data);

    return savedUser;
  }

}