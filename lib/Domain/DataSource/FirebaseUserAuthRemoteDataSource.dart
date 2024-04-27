import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';

abstract class FirebaseUserAuthRemoteDataSource {
  Future<User> createUser({required UserDTO userDTO});
  Future<User> loginWithEmailAndPassword({required String email , required String password});
  Future<User> signInWithGoogle();
  Future<void> resetPassword({required String email});
  Future<void> userSignOut();
  Future<User> updateUserImage({required String photo});
  Future<User> updateUserDisplayName({required String name});
  Future<void> updateUserPassword({required String newPassword});
}