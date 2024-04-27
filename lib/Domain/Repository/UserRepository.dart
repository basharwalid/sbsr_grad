import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

abstract class UserRepository{
  Future<User> createUserInFirebaseAuth(MyUser user);
  Future<User> signInWithEmailAndPassword({required String email ,required String password});
  Future<bool> userExist({required String uid});
  Future<void> addUserToFirebaseFireStore({required MyUser user , required String uid});
  Future<User> signInWithGoogle();
  Future<void> resetPassword({required String email});
  Future<void> userSignOut();
  Future<String> uploadUserImage({required XFile image});
  Future<String> updateUserImage({required XFile file , required String url});
  Future<MyUser?> getUser({required String uid});
  Future<User> updateUserPhoto({required String photo});
  Future<String> updateUserData({required MyUser user, required String uid});
  Future<User> updateUserDisplayName({required String name});
  Future<void> updateUserPassword({required String newPassword});
}