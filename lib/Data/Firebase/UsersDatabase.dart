import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';

class UsersDatabase {
  UsersDatabase._();

  static UsersDatabase? _instance;

  static getUserDatabase() {
    _instance ??= UsersDatabase._();
    return _instance;
  }
  CollectionReference<UserDTO> getCollectionReference() {
    return FirebaseFirestore.instance.collection("Users").withConverter(
      fromFirestore: (snapshot, options) =>
          UserDTO.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),);
  }

  Future<void> addUser(UserDTO userDTO)async{
    await getCollectionReference().doc(userDTO.uid).set(userDTO);
  }
}
