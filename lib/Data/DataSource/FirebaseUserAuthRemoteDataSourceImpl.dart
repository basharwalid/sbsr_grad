import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Firebase/FirebaseUserAuth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseAuthException.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseLoginException.dart';
import 'package:sbsr_grad/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:sbsr_grad/Domain/Exceptions/UnknownException.dart';

FirebaseUserAuthRemoteDataSource getFirebaseUserAuthRemoteDataSource() {
  return FirebaseUserAuthRemoteDataSourceImpl(
      fireBaseUserAuth: injectFirebaseUserAuth());
}

class FirebaseUserAuthRemoteDataSourceImpl
    implements FirebaseUserAuthRemoteDataSource {
  FireBaseUserAuth fireBaseUserAuth;

  FirebaseUserAuthRemoteDataSourceImpl({required this.fireBaseUserAuth});

  @override
  Future<User> createUser({required UserDTO userDTO}) async {
    try {
      var response = await fireBaseUserAuth.createUser(userDTO: userDTO);
      return response;
    } on FirebaseAuthException catch (e) {
      throw FirebaseUserAuthException(errorMessage: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseUserAuthException(errorMessage: e.code);
    }
  }

  @override
  Future<User> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var response = await fireBaseUserAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch (e) {
      throw FirebaseLoginException(errorMessage: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseLoginException(errorMessage: e.code);
    } on TimeoutException catch (e) {
      throw TimeOutOperationsException(errorMessage: "User Auth Timed Out");
    } catch (e) {
      throw UnknownException(errorMessage: "Unknown Error");
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      var response = await fireBaseUserAuth
          .signInWithGoogle()
          .timeout(const Duration(seconds: 60));
      return response;
    } on FirebaseAuthException catch (e) {
      throw FirebaseLoginException(errorMessage: e.code);
    } on FirebaseException catch (e) {
      throw FirebaseLoginException(errorMessage: e.code);
    } on TimeoutException catch (e) {
      throw TimeOutOperationsException(errorMessage: "Timeout");
    } catch (e) {
      throw UnknownException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await fireBaseUserAuth.resetPassword(email: email);
  }

  @override
  Future<void> userSignOut() async {
    await fireBaseUserAuth.userSignOut();
  }

  @override
  Future<User> updateUserImage({required String photo}) async {
    try{
      var response = await fireBaseUserAuth.updateUserImage(photo);
      return response;
    }on FirebaseUserAuthException catch(e){
        throw FirebaseUserAuthException(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<User> updateUserDisplayName({required String name})async{
    var response = await fireBaseUserAuth.updateUserDisplayName(name: name);
    return response;
  }
}
