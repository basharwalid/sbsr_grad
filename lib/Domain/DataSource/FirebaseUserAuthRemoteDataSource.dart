import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';

abstract class FirebaseUserAuthRemoteDataSource {
  Future<User> createUser({required UserDTO userDTO});
}