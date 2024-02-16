import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sbsr_grad/Data/Firebase/UsersDatabase.dart';
import 'package:sbsr_grad/Data/Models/UserDTO.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseUserDatabaseException.dart';
import 'package:sbsr_grad/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:sbsr_grad/Domain/Exceptions/UnknownException.dart';

UsersDatabaseRemoteDataSource getUsersDatabaseRemoteDataSource(){
  return UsersDatabaseRemoteDataSourceImpl(
      database: getUsersDatabase()
  );
}

class UsersDatabaseRemoteDataSourceImpl
    implements UsersDatabaseRemoteDataSource {
  UsersDatabase database;

  UsersDatabaseRemoteDataSourceImpl({required this.database});

  @override
  Future<void> addUser(UserDTO userDTO) async {
    await database.addUser(userDTO);
  }

  @override
  Future<bool> userExist({required String uid}) async{
    try{
      var response = await database.userExist(uid: uid);
      return response;
    }on FirebaseException catch(e){
      throw FirebaseFireStoreDatabaseException(errorMessage: e.code);
    }on TimeoutException {
      throw TimeOutOperationsException(errorMessage: "Operation Timed Out");
    }catch(e){
      throw UnknownException(errorMessage: "Unknown Error");
    }
  }
}
