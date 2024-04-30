import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Data/DataSource/FirebaseImageDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/DataSource/FirebaseUserAuthRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Data/DataSource/UsersDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseUserAuthRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/UsersDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/DataSource/firebaseImageDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';
import 'package:sbsr_grad/Domain/Repository/UserRepository.dart';

UserRepository injectUserRepository() {
  return UserRepositoryImpl(
      firebaseUserAuthRemoteDataSource: getFirebaseUserAuthRemoteDataSource(),
      databaseRemoteDataSource: getUsersDatabaseRemoteDataSource(),
      firebaseImageDatabaseRemoteDataSource:
          injectFirebaseImageDatabaseRemoteDataSourceImpl());
}

class UserRepositoryImpl implements UserRepository {
  FirebaseUserAuthRemoteDataSource firebaseUserAuthRemoteDataSource;
  UsersDatabaseRemoteDataSource databaseRemoteDataSource;
  FirebaseImageDatabaseRemoteDataSource firebaseImageDatabaseRemoteDataSource;

  UserRepositoryImpl(
      {required this.firebaseUserAuthRemoteDataSource,
      required this.databaseRemoteDataSource,
      required this.firebaseImageDatabaseRemoteDataSource});

  @override
  Future<User> createUserInFirebaseAuth(MyUser user) async {
    var response = await firebaseUserAuthRemoteDataSource.createUser(
        userDTO: user.toDataSource());
    return response;
  }

  @override
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    var response = await firebaseUserAuthRemoteDataSource
        .loginWithEmailAndPassword(email: email, password: password);
    return response;
  }

  @override
  Future<bool> userExist({required String uid}) async {
    var response = await databaseRemoteDataSource.userExist(uid: uid);
    return response;
  }

  @override
  Future<void> addUserToFirebaseFireStore(
      {required MyUser user, required String uid}) async {
    await databaseRemoteDataSource.addUser(user.toDataSource(), uid);
  }

  @override
  Future<User> signInWithGoogle() async {
    var response = await firebaseUserAuthRemoteDataSource.signInWithGoogle();
    return response;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await firebaseUserAuthRemoteDataSource.resetPassword(email: email);
  }

  @override
  Future<void> userSignOut() async {
    await firebaseUserAuthRemoteDataSource.userSignOut();
  }

  @override
  Future<String> uploadUserImage({required XFile image}) async {
    var response =
        await firebaseImageDatabaseRemoteDataSource.uploadImage(file: image);
    return response;
  }

  @override
  Future<MyUser?> getUser({required String uid}) async {
    var response = await databaseRemoteDataSource.getUser(uid: uid);
    return response;
  }

  @override
  Future<String> updateUserImage(
      {required XFile file, required String url}) async {
    if (url.isEmpty) {
      var upload =
          await firebaseImageDatabaseRemoteDataSource.uploadImage(file: file);
      return upload;
    } else {
      var update = await firebaseImageDatabaseRemoteDataSource.updateUserImage(
          file: file, url: url);
      return update;
    }
  }

  @override
  Future<User> updateUserPhoto({required String photo}) async {
    var response =
        await firebaseUserAuthRemoteDataSource.updateUserImage(photo: photo);
    return response;
  }

  @override
  Future<User> updateUserDisplayName({required String name}) async {
    var response = await firebaseUserAuthRemoteDataSource.updateUserDisplayName(
        name: name);
    return response;
  }

  @override
  Future<String> updateUserData(
      {required MyUser user, required String uid}) async {
    await databaseRemoteDataSource.updateUserData(
        user: user.toDataSource(), uid: uid);
    return "Your Data Updated Successfully";
  }

  @override
  Future<void> updateUserPassword(
      {required String newPassword,
      required String password,
      required String email}) async {
    await firebaseUserAuthRemoteDataSource.updateUserPassword(
        newPassword: newPassword, password: password, email: email);
  }
}
