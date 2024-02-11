import 'package:sbsr_grad/Data/DataSource/FirebaseUserAuthRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/DataSource/UsersDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/Firebase/FirebaseUserAuth.dart';
import 'package:sbsr_grad/Data/Firebase/UsersDatabase.dart';
import 'package:sbsr_grad/Data/Repository/UserRepositoryImpl.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

FireBaseUserAuth getFirebaseAuthConfig() {
  return FireBaseUserAuth.getInstance();
}

UsersDatabase getUsersDatabase() {
  return UsersDatabase.getUserDatabase();
}

FirebaseUserAuthRemoteDataSource getFirebaseUserAuthRemoteDataSource(
    FireBaseUserAuth fireBaseUserAuth) {
  return FirebaseUserAuthRemoteDataSourceImpl(
      fireBaseUserAuth: fireBaseUserAuth);
}

UsersDatabaseRemoteDataSource getUsersDatabaseRemoteDataSource() {
  return UsersDatabaseRemoteDataSourceImpl(database: getUsersDatabase());
}

UserRepository getUserRepository(
    FirebaseUserAuthRemoteDataSource firebaseUserAuthRemoteDataSource,
    UsersDatabaseRemoteDataSource usersDatabaseRemoteDataSource) {
  return UserRepositoryImpl(
      firebaseUserAuthRemoteDataSource: firebaseUserAuthRemoteDataSource,
      databaseRemoteDataSource: usersDatabaseRemoteDataSource);
}

UserRepository injectAuthRepo() {
  return getUserRepository(
      getFirebaseUserAuthRemoteDataSource(getFirebaseAuthConfig()),
      getUsersDatabaseRemoteDataSource());
}
