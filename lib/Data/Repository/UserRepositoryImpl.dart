import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Data/DataSource/FirebaseUserAuthRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/DataSource/UsersDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UserRepository injectUserRepository(){
  return UserRepositoryImpl(
      firebaseUserAuthRemoteDataSource: getFirebaseUserAuthRemoteDataSource(),
      databaseRemoteDataSource: getUsersDatabaseRemoteDataSource()
  );
}

class UserRepositoryImpl implements UserRepository{
  FirebaseUserAuthRemoteDataSource firebaseUserAuthRemoteDataSource;
  UsersDatabaseRemoteDataSource databaseRemoteDataSource;
  UserRepositoryImpl({required this.firebaseUserAuthRemoteDataSource ,required this.databaseRemoteDataSource});

  @override
  Future<User> createUserInFirebaseAuth(MyUser user) async {
    var response = await firebaseUserAuthRemoteDataSource.createUser(
        userDTO: user.toDataSource());
    user.uid = response.uid;
    return response;
  }

  @override
  Future<User> signInWithEmailAndPassword({required String email, required String password})async{
    var response = await firebaseUserAuthRemoteDataSource.loginWithEmailAndPassword(email: email, password: password);
    return response;
  }

  @override
  Future<bool> userExist({required String uid}) async{
      var response = await databaseRemoteDataSource.userExist(uid: uid);
      return response;
  }

  @override
  Future<void> addUserToFirebaseFireStore({required MyUser user})async{
    await databaseRemoteDataSource.addUser(user.toDataSource());
  }

  @override
  Future<User> signInWithGoogle() async{
    var response = await firebaseUserAuthRemoteDataSource.signInWithGoogle();
    return response;
  }

  @override
  Future<void> resetPassword({required String email})async{
    await firebaseUserAuthRemoteDataSource.resetPassword(email: email);
  }


}