import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseImagesDatabase {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //No one can create object from this class
  FirebaseImagesDatabase._();

  static FirebaseImagesDatabase? _instance;

  static FirebaseImagesDatabase getInstance() {
    /*if(_instance == null){
      _instance = FirebaseImagesDatabase._();
    }*/
    //make same as the above if condition
    return _instance ??= FirebaseImagesDatabase._();
  }

  Future<String> uploadImage({required XFile image}) async {
    var response = await _firebaseStorage
        .ref("images/${generateRandomString()}")
        .putFile(File(image.path), SettableMetadata(contentType: "image/jpeg"));
    var url = response.ref.getDownloadURL();
    return url;
  }

  String generateRandomString() {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(30, (index) => chars[r.nextInt(chars.length)]).join();
  }
}