import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';

abstract class UsersDatabaseRemoteDataSource{
  Future<void> addUser(UserDTO userDTO);
  Future<bool> userExist({required String uid});
}