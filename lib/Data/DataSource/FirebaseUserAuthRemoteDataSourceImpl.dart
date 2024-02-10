import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Firebase/FirebaseUserAuth.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseAuthException.dart';

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
}
