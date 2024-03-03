import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';


UsersDatabase getUsersDatabase() {
  return UsersDatabase.getUserDatabase();
}

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

  Future<void> addUser(UserDTO userDTO , String uid) async {
    await getCollectionReference().doc(uid).set(userDTO);
  }

  Future<bool> userExist({required String uid}) async {
    var doc = await getCollectionReference().doc(uid).get();
    return doc.exists;
  }

  Future<UserDTO?> getUser({required String uid}) async {
    var doc = await getCollectionReference().doc(uid).get();
    return doc.data();
  }

  Future<UserDTO> updateUserData({required UserDTO user , required String uid})async{
    await getCollectionReference().doc(uid).update(user.toFireStore());
    return user;
  }

}
