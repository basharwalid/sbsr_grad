import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

abstract class UsersDatabaseRemoteDataSource{
  Future<void> addUser(UserDTO userDTO , String uid);
  Future<bool> userExist({required String uid});
  Future<MyUser?> getUser({required String uid});
  Future<MyUser> updateUserData({required UserDTO user , required String uid});
}