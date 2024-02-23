import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

FireBaseUserAuth injectFirebaseUserAuth() {
  return FireBaseUserAuth.getInstance();
}

class FireBaseUserAuth {
  //Singleton
  FireBaseUserAuth._();

  static FireBaseUserAuth? instance;

  static getInstance() {
    return instance ??= FireBaseUserAuth._();
  }

  final _firebase = FirebaseAuth.instance;

  Future<User> createUser({required UserDTO userDTO}) async {
    await _firebase
        .createUserWithEmailAndPassword(
            email: userDTO.email, password: userDTO.password)
        .then((value) => value.user!.updateDisplayName(userDTO.name));
    return _firebase.currentUser!;
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebase.signInWithEmailAndPassword(
        email: email, password: password);
    return _firebase.currentUser!;
  }

  Future<User> signInWithGoogle() async {
    await _firebase.signOut();
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleSignIn!.authentication;
    final user = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await _firebase.signInWithCredential(user);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("LoggedIn", true);
    return _firebase.currentUser!;
  }

  Future<void> resetPassword({required String email}) async {
    await _firebase.sendPasswordResetEmail(email: email);
  }
  Future<void> userSignOut()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("LoggedIn", false);
    await _firebase.signOut();
  }
}
