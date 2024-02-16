
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

FireBaseUserAuth injectFirebaseUserAuth(){
  return FireBaseUserAuth.getInstance();
}

class FireBaseUserAuth{

  //Singelton
  FireBaseUserAuth._();
  static FireBaseUserAuth? instance;
  static getInstance(){
    return  instance ??= FireBaseUserAuth._();
  }
  final _firebase = FirebaseAuth.instance;

  Future<User> createUser({required UserDTO userDTO})async{
      await _firebase.createUserWithEmailAndPassword(email: userDTO.email, password: userDTO.password).then((value) => value.user!.updateDisplayName(userDTO.name));
      return _firebase.currentUser!;
  }

  Future<User> signInWithEmailAndPassword({required String email,required String password})async{
     await _firebase.signInWithEmailAndPassword(email: email, password: password);
     return _firebase.currentUser!;
  }

  Future<User> signInWithGoogle()async{
    GoogleSignIn().signOut();
    print("1");
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    print("2");
      final GoogleSignInAuthentication googleAuth = await googleSignIn!.authentication;
    print("3");
      final user = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
    print("4");
     _firebase.signInWithCredential(user);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("LoggedIn", true);
      return _firebase.currentUser!;
  }
}