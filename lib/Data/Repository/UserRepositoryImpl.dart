import 'package:firebase_auth/firebase_auth.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

class UserRepositoryImpl implements UserRepository{
  FirebaseUserAuthRemoteDataSource firebaseUserAuthRemoteDataSource;
  UsersDatabaseRemoteDataSource databaseRemoteDataSource;
  UserRepositoryImpl({required this.firebaseUserAuthRemoteDataSource ,required this.databaseRemoteDataSource});

  @override
  Future<User> createUserFirebaseFireStore(MyUser user) async{
    var response = await firebaseUserAuthRemoteDataSource.createUser(userDTO: user.toDataSource());
    user.uid = response.uid;
    await databaseRemoteDataSource.addUser(user.toDataSource());
    return response;
  }
}