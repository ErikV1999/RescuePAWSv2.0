
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/pet.dart';
import '../models/user.dart';

class FirestoreService {
  final User? user;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  CollectionReference petsRef = FirebaseFirestore.instance.collection('pets');

  FirestoreService({required this.user});

  Future<SavedUser> getUserFromFirestore()  async {
    SavedUser savedUser = SavedUser();

    DocumentSnapshot snapshot = await usersRef.doc(user?.uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    savedUser.SetUser(data);

    return savedUser;
  }
  //creates pet doc in pets collection
  //saves pet id in user's document
  String createPet(Pet pet) {
    DocumentReference petRef = petsRef.doc();
    String petID = petRef.id;
    petRef.set(pet.toMap());

    usersRef.doc(user?.uid).update({'pet': petID});

    return petID;
  }

  writeImagetoUser(imageUrl, String petID) {
    petsRef.doc(petID).update({'images': FieldValue.arrayUnion([imageUrl])});
  }

  Future<List<String>> getPetCollection()  async {
    List<String> documents = [];
    QuerySnapshot snapshot = await petsRef.get();

    for(int i = 0; i < snapshot.docs.length; i++) {
      documents.add(snapshot.docs[i].id);
    }

    return documents;
  }

  Future<Pet> getPetById(String petID) async {

    DocumentSnapshot snapshot = await petsRef.doc(petID).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    Pet _pet = Pet.fromMap(data);

    return _pet;
  }


}