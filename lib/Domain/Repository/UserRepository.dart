import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

abstract class UserRepository{
  Future<User> createUserFirebaseFireStore(MyUser user);
  Future<User> signInWithEmailAndPassword({required String email ,required String password});
  Future<bool> userExist({required String uid});
}