import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  User? user;

  StorageService({required this.user});

  uploadFileToStorage(file) {
    UploadTask task = storage.ref().child("images/${DateTime.now().toString()}").putFile(file);
    return task;
  }

}