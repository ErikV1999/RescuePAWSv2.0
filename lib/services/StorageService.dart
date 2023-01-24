
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  User? user;

  StorageService({required this.user});

  uploadFileToStorage(File file, String petId) {
    UploadTask task = storage.ref().child("images/$petId/${DateTime.now().toString()}").putFile(file);
    return task;
  }

}