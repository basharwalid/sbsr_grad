
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';

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
}